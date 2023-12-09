import 'package:wizzer_test/core/domain/entities/gif_entity.dart';

abstract class IGiphyRepository {
  Future<List<GifEntity>> getTrendingGifs(int page);
}
