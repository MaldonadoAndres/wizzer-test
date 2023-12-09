import 'package:get/instance_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/core/domain/use_cases/search_by_name_use_case.dart';

part 'search_by_name_provider.g.dart';

@riverpod
class SearchByName extends _$SearchByName {
  final SearchByNameUseCase _searchByNameUseCase = Get.find<SearchByNameUseCase>();
  int _offset = 0;
  String _name = '';
  @override
  FutureOr<List<GifEntity>> build() {
    return [];
  }

  Future<void> searchByName(String name) async {
    state = const AsyncLoading();
    _offset = 0;
    _name = name;
    final newGifs = await _searchByNameUseCase(name, _offset);
    state = AsyncData(newGifs);
    _offset += 10;
  }

  Future<void> getMoreByName() async {
    final newGifs = await _searchByNameUseCase(_name, _offset);
    update((oldGifs) => [...oldGifs, ...newGifs]);
    _offset += 10;
  }

  Future<void> likeGif(bool isLiked, int index) async {
    state.value?[index].original.isLiked = isLiked;
  }
}
