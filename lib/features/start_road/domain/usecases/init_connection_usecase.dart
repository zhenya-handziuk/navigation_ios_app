import '../repositories/start_road_repository.dart';

class InitConnectionUseCase {
  final StartRoadRepository repository;

  InitConnectionUseCase(this.repository);

  Future<void> call() async {
    await repository.initConnection();
  }
}