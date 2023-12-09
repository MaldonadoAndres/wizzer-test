import 'package:get/instance_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/core/domain/use_cases/get_trending_gifs_use_case.dart';

part 'get_trending_gifs_provider.g.dart';

@riverpod
class GetTrendingGifs extends _$GetTrendingGifs {
  int _currentPage = 0;
  @override
  FutureOr<List<GifEntity>> build() {
    return [];
  }

  Future<void> getMoreGifs() async {
    state = const AsyncLoading();
    final getTrendingGifs = Get.find<GetTrendingGifsUseCase>();
    state = await AsyncValue.guard(() => getTrendingGifs(_currentPage));
    _currentPage++;
  }
}
