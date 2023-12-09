import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/core/domain/repositories/i_giphy_repository.dart';

class GetTrendingGifsUseCase {
  final IGiphyRepository _repository;

  GetTrendingGifsUseCase({required IGiphyRepository repository}) : _repository = repository;
  Future<List<GifEntity>> call(int offset) {
    return _repository.getTrendingGifs(offset);
  }
}
