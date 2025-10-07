import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/check_initial_data.dart';

class InitBloc extends Cubit<InitState> {
  final CheckInitialData checkInitialData;

  InitBloc(this.checkInitialData) : super(InitInitial());

  Future<void> initialize() async {
    emit(InitLoading());
    try {
      final isInitialized = await checkInitialData();
      if (isInitialized) {
        emit(InitLoaded());
      } else {
        emit(InitError('Initialization failed'));
      }
    } catch (e) {
      emit(InitError(e.toString()));
    }
  }
  
}

abstract class InitState {}
class InitInitial extends InitState {}
class InitLoading extends InitState {}
class InitLoaded extends InitState {}
class InitError extends InitState {
  final String message;
  InitError(this.message);
}