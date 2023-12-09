import 'package:get/instance_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/core/domain/use_cases/get_trending_gifs_use_case.dart';

part 'get_trending_gifs_provider.g.dart';

@riverpod
class GetTrendingGifs extends _$GetTrendingGifs {
  int _offset = 0;
  final GetTrendingGifsUseCase _getTrendingGifsUseCase = Get.find<GetTrendingGifsUseCase>();

  @override
  FutureOr<List<GifEntity>> build() async {
    state = const AsyncValue.loading();
    final response = await _getTrendingGifsUseCase(_offset);
    _offset += 10;
    return response;
  }

  Future<void> getMoreGifs() async {
    final newGifs = await _getTrendingGifsUseCase(_offset);
    update((oldGifs) => [...oldGifs, ...newGifs]);
    _offset += 10;
  }

  Future<void> likeGif(bool isLiked, int index) async {
    state.value?[index].original.isLiked = isLiked;
  }
}
