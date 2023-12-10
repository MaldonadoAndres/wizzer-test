import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wizzer_test/core/widgets/loader_indicator.dart';
import 'package:wizzer_test/features/home_with_bloc/cubit/trending_gifs/trending_gifs_cubit.dart';
import 'package:wizzer_test/features/home_with_riverpod/widgets/gifs_grid.dart';

class TrendingGifsBlocView extends HookWidget {
  const TrendingGifsBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    bool isLoadingMore = false;
    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          if (!isLoadingMore) {
            context.read<TrendingGifsCubit>().getTredingGifs();
            isLoadingMore = true;
          }
        }
      });
      return null;
    });
    return BlocBuilder<TrendingGifsCubit, TrendingGifsState>(
      builder: (context, state) {
        return state.when(
          loading: () => const LoaderIndicator(),
          error: (msg) => Text(msg),
          success: (gifs) {
            isLoadingMore = false;
            return Center(
              child: GifsGrid(
                gifs: gifs,
                scrollController: scrollController,
                onLikeButtonTap: (isLiked, index) => context.read<TrendingGifsCubit>().likeGif(isLiked, index),
              ),
            );
          },
        );
      },
    );
  }
}
