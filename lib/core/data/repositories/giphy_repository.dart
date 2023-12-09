import 'package:wizzer_test/core/api/giphy_api.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/core/domain/repositories/i_giphy_repository.dart';
import 'package:wizzer_test/core/extensions/exception_extension.dart';

class GiphyRepository implements IGiphyRepository {
  final GiphyApi _api;

  GiphyRepository({required GiphyApi api}) : _api = api;
  @override
  Future<List<GifEntity>> getTrendingGifs(int offset) async {
    try {
      final response = await _api.getTrendingGifs(offset);
      return response.data;
    } on Exception catch (e) {
      throw e.handleException();
    }
  }

  @override
  Future<List<GifEntity>> searchByName(int offset, String name) async {
    try {
      final response = await _api.searchByName(name, offset);
      return response.data;
    } on Exception catch (e) {
      throw e.handleException();
    }
  }
}
