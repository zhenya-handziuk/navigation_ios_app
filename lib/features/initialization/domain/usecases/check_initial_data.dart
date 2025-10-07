import '../repositories/init_repository.dart';

class CheckInitialData {
  final InitRepository repository;

  CheckInitialData(this.repository);

  Future<bool> call() async {
    return await repository.checkInitialization();
  }
}