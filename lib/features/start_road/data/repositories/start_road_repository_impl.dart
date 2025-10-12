import '../../domain/repositories/start_road_repository.dart';
import '../datasources/remote_data_source.dart';

class StartRoadRepositoryImpl implements StartRoadRepository {
  final InitRemoteDataSource remoteDataSource;

  StartRoadRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> initConnection() async {
    final trailId = await remoteDataSource.initRoadConnection({
      "startTime": "2025-02-16T17:16:11.333Z",
      "speed": 0,
      "latitude": 50.4501,
      "longitude": 30.5234,
      "status": "progress"
    });

    return trailId;
  }
}