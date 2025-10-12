import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/init_connection_usecase.dart';

class StartRoadBloc extends Cubit<StartRoadState> {
  final InitConnectionUseCase initConnectionUseCase;
  int countdown = 3;
  Timer? _timer;

  StartRoadBloc(this.initConnectionUseCase) : super(StartRoadInitial());

  Future<void> startProcess() async {
    String trailId = '';
    emit(StartRoadLoading(countdown));

    initConnectionUseCase.call().then((onValue) => {
      trailId = onValue
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      countdown--;

      if (countdown > 0) {
        emit(StartRoadLoading(countdown));
      } else {
        timer.cancel();
        emit(StartRoadLoaded(trailId));
      }
    });

    @override
    Future<void> close() {
      _timer?.cancel();
      return super.close();
    }
  }
}

abstract class StartRoadState {}
class StartRoadInitial extends StartRoadState {}
class StartRoadLoading extends StartRoadState {
  final int countdown;
  StartRoadLoading(this.countdown);
}
class StartRoadLoaded extends StartRoadState {
  final String trailId;
  StartRoadLoaded(this.trailId);
}
class StartRoadError extends StartRoadState {
  final String message;
  StartRoadError(this.message);
}