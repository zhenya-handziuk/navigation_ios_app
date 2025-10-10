import 'package:get_it/get_it.dart';

import './data/datasources/remote_data_source.dart';
import './data/repositories/start_road_repository_impl.dart';
import './domain/repositories/start_road_repository.dart';
import './domain/usecases/init_connection_usecase.dart';

final sl = GetIt.instance;

Future<void> initStartRoadFeatureDI() async {
  // Data sources
  sl.registerLazySingleton<InitRemoteDataSource>(
    () => InitRemoteDataSource(sl()),
  );

  // Repository
  sl.registerLazySingleton<StartRoadRepository>(
    () => StartRoadRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton<InitConnectionUseCase>(
    () => InitConnectionUseCase(sl()),
  );
}