import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'features/initialization/presentation/pages/splash_page.dart';
import 'features/initialization/presentation/bloc/init_bloc.dart';
import 'features/initialization/domain/usecases/check_initial_data.dart';
import 'features/initialization/data/repositories/init_repository_impl.dart';
import 'features/initialization/data/datasources/init_remote_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    throw Exception('Error loading .env file: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: AppTheme.lightTheme,
    //   home: const SplashPage(),
    // );
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
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}