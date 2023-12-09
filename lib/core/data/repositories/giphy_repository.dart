import 'package:wizzer_test/core/api/giphy_api.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/core/domain/repositories/i_giphy_repository.dart';
import 'package:wizzer_test/core/extensions/exception_extension.dart';

class GiphyRepository implements IGiphyRepository {
  final GiphyApi _api;

  GiphyRepository({required GiphyApi api}) : _api = api;
  @override
  Future<List<GifEntity>> getTrendingGifs(int page) async {
    try {
      final response = await _api.getTrendingGifs(offset: page);
      return response.data;
    } on Exception catch (e) {
      throw e.handleException();
    }
  }
}
