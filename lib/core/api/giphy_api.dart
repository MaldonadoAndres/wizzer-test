import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wizzer_test/core/data/model/gif_model.dart';
import 'package:wizzer_test/core/utils/list_data_wrapper.dart';

part 'giphy_api.g.dart';

const String kApiKey = 'e44G0mVZe5tICHQ1QMCnS0iW0TLPeyW0';

@RestApi(baseUrl: 'https://api.giphy.com/v1/')
abstract class GiphyApi {
  factory GiphyApi() {
    final dio = Dio();
    dio.interceptors.addAll([
      PrettyDioLogger(
        requestBody: false,
        responseBody: false,
        requestHeader: false,
        responseHeader: false,
        request: true,
        error: true,
        compact: true,
        maxWidth: 150,
      ),
    ]);
    dio.options = BaseOptions(
      receiveTimeout: const Duration(seconds: 20),
      connectTimeout: const Duration(seconds: 20),
      headers: {},
    );
    return _GiphyApi(dio);
  }

  @GET('gifs/trending')
  Future<ListDataWrapper<GifModel>> getTrendingGifs(
    @Query('offset') int offset, {
    @Query('api_key') String apiKey = kApiKey,
    @Query('limit') int limit = 10,
  });
  @GET('gifs/search')
  Future<ListDataWrapper<GifModel>> searchByName(
    @Query('q') String name,
    @Query('offset') int offset, {
    @Query('api_key') String apiKey = kApiKey,
    @Query('limit') int limit = 10,
  });
}
