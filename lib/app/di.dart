import 'package:get_it/get_it.dart';

import '../features/initialization/di.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Data sources
  await initInitializationFeatureDI();
}
