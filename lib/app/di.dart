import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../core/network/api_client.dart';
import '../features/initialization/di.dart';
import '../features/start_road/di.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // External
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));

  // Data sources
  await initInitializationFeatureDI();
  await initStartRoadFeatureDI();

}
