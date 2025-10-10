import '../datasources/init_remote_data_source.dart';
import '../../domain/repositories/init_repository.dart';

class InitRepositoryImpl implements InitRepository {
  final InitRemoteDataSource remoteDataSource;

  InitRepositoryImpl(this.remoteDataSource);

  @override
  Future<bool> checkInitialization() async {
    try {
      final result = await remoteDataSource.checkStatus();
      return result;
    } catch (e) {
      print('Error in InitRepositoryImpl: $e');
      return false;
    }
  }
}