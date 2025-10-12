import '../repositories/start_road_repository.dart';

class InitConnectionUseCase {
  final StartRoadRepository repository;

  InitConnectionUseCase(this.repository);

  Future<String> call() async {
    return await repository.initConnection();
  }
}