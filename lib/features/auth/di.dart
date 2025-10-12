import 'package:get_it/get_it.dart';

import 'data/datasources/auth.dart';
import 'data/repositories/auth_impl.dart';
import 'domain/repositories/auth.dart';
import 'domain/usecases/logout_usecase.dart';
import 'presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initAuthFeatureDI() async {
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(sl()));
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(sl()));
}