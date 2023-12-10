import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/core/domain/use_cases/get_trending_gifs_use_case.dart';
import 'package:wizzer_test/core/utils/custom_exceptions.dart';

part 'trending_gifs_cubit.freezed.dart';
part 'trending_gifs_state.dart';

class TrendingGifsCubit extends Cubit<TrendingGifsState> {
  TrendingGifsCubit() : super(const TrendingGifsState.loading()) {
    getTredingGifs();
  }
  final GetTrendingGifsUseCase _getTrendingGifsUseCase = Get.find<GetTrendingGifsUseCase>();
  int _offset = 0;
  final _trendingGifs = <GifEntity>[];
  void getTredingGifs() async {
    try {
      final response = await _getTrendingGifsUseCase(_offset);
      _trendingGifs.addAll(response);
      emit(_Success([..._trendingGifs]));
      _offset += 10;
    } catch (e) {
      Logger().e('Error $e', stackTrace: StackTrace.current);
      final msg = (e as CustomException).message;
      emit(_Error(msg));
    }
  }

  void likeGif(bool isLiked, int index) {
    _trendingGifs[index].original.isLiked = isLiked;
    emit(_Success([..._trendingGifs]));
  }
}
