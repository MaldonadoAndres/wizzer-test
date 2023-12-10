part of 'trending_gifs_cubit.dart';

@freezed
class TrendingGifsState with _$TrendingGifsState {
  const factory TrendingGifsState.loading() = _Loading;
  const factory TrendingGifsState.success(List<GifEntity> gifs) = _Success;
  const factory TrendingGifsState.error(String msg) = _Error;
}
