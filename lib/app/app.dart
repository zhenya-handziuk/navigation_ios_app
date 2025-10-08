import 'package:flutter/material.dart';
import 'router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../shared/styles/app_theme.dart';
import '../features/initialization/presentation/bloc/init_bloc.dart';
import '../features/initialization/domain/usecases/check_initial_data.dart';
import '../features/initialization/data/repositories/init_repository_impl.dart';
import '../features/initialization/data/datasources/init_remote_data_source.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final client = http.Client();
    final dataSource = InitRemoteDataSource(client);
    final repo = InitRepositoryImpl(dataSource);
    final usecase = CheckInitialData(repo);

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