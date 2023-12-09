import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/core/domain/repositories/i_giphy_repository.dart';

class SearchByNameUseCase {
  final IGiphyRepository _repository;

  SearchByNameUseCase({required IGiphyRepository repository}) : _repository = repository;
  Future<List<GifEntity>> call(String name, int offset) {
    return _repository.searchByName(offset, name);
  }
}
