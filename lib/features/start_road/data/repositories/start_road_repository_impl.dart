import '../../domain/repositories/start_road_repository.dart';
import '../datasources/remote_data_source.dart';

class StartRoadRepositoryImpl implements StartRoadRepository {
  final InitRemoteDataSource remoteDataSource;

  StartRoadRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> initConnection() async {
    final isInitialized = await remoteDataSource.fetchData();
    print(isInitialized);
  }
}