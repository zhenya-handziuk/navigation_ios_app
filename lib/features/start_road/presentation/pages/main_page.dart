import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/layout/app_scaffold.dart';
import '../../domain/usecases/init_connection_usecase.dart';

import '../bloc/start_road_bloc.dart';
import 'countdown_switcher_page.dart';
import 'road_page.dart';

class StartRoadPage extends StatelessWidget {
  const StartRoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final InitConnectionUseCase initConnectionUseCase = GetIt.instance<InitConnectionUseCase>();

    return BlocProvider(
      create: (_) => StartRoadBloc(initConnectionUseCase)..startProcess(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: BlocBuilder<StartRoadBloc, StartRoadState>(
            builder: (context, state) {
              if (state is StartRoadLoading) {
                return CountdownSwitcher(countdown: state.countdown);
              } else if (state is StartRoadLoaded) {
                return RoadPage(state: state);
              }
              return const SizedBox.shrink();
            }
          )
        )
      ),
    );
  }
}