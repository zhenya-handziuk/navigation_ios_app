import 'package:flutter/material.dart';
import 'router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../shared/styles/app_theme.dart';
import '../features/initialization/presentation/bloc/init_bloc.dart';
import '../features/initialization/domain/usecases/check_initial_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final usecase = GetIt.instance<CheckInitialData>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => InitBloc(usecase)..initialize(),
        ),
      ],
      child: MaterialApp(
        title: 'Navigation',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRouter.home,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}