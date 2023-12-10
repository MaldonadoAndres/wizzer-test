part of 'search_by_name_cubit.dart';

@freezed
class SearchByNameState with _$SearchByNameState {
  const factory SearchByNameState.searching() = _Searching;
  const factory SearchByNameState.error(String msg) = _Error;
  const factory SearchByNameState.success(List<GifEntity> gifs) = _Success;
}
