import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/core/domain/use_cases/search_by_name_use_case.dart';
import 'package:wizzer_test/core/utils/custom_exceptions.dart';

part 'search_by_name_cubit.freezed.dart';
part 'search_by_name_state.dart';

class SearchByNameCubit extends Cubit<SearchByNameState> {
  final SearchByNameUseCase _searchByNameUseCase = Get.find<SearchByNameUseCase>();
  SearchByNameCubit() : super(const _Success([]));
  int _offset = 0;
  final _searchResults = <GifEntity>[];
  String _name = '';
  void startSearchByName(String name) async {
    try {
      emit(const _Searching());
      _searchResults.clear();
      _name = name;
      _offset = 0;
      final response = await _searchByNameUseCase(_name, _offset);
      _searchResults.addAll(response);
      emit(_Success([..._searchResults]));
      _offset += 10;
    } catch (e) {
      Logger().e('Error $e', stackTrace: StackTrace.current);
      final msg = (e as CustomException).message;
      emit(_Error(msg));
    }
  }

  void getMoreNamed() async {
    try {
      final response = await _searchByNameUseCase(_name, _offset);
      _searchResults.addAll(response);
      emit(_Success([..._searchResults]));
      _offset += 10;
    } catch (e) {
      Logger().e('Error $e', stackTrace: StackTrace.current);
      final msg = (e as CustomException).message;
      emit(_Error(msg));
    }
  }

  void likeGif(bool isLiked, int index) {
    _searchResults[index].original.isLiked = isLiked;
    emit(_Success([..._searchResults]));
  }
}
