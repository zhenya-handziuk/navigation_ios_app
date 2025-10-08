import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import './data/datasources/init_remote_data_source.dart';
import './data/repositories/init_repository_impl.dart';
import './domain/repositories/init_repository.dart';
import './domain/usecases/check_initial_data.dart';
import './presentation/bloc/init_bloc.dart';

final sl = GetIt.instance;

Future<void> initInitializationFeatureDI() async {
  // Data sources
  sl.registerLazySingleton<InitRemoteDataSource>(
    () => InitRemoteDataSource(sl()),
  );

  // Repository
  sl.registerLazySingleton<InitRepository>(
    () => InitRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton<CheckInitialData>(
    () => CheckInitialData(sl()),
  );

  // Bloc
  sl.registerFactory<InitBloc>(
    () => InitBloc(sl()),
  );

  // External
  sl.registerLazySingleton<http.Client>(() => http.Client());
}
