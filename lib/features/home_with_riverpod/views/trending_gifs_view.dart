import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizzer_test/core/utils/custom_exceptions.dart';
import 'package:wizzer_test/core/widgets/loader_indicator.dart';
import 'package:wizzer_test/features/home_with_riverpod/providers/get_trending_gifs_provider.dart';
import 'package:wizzer_test/features/home_with_riverpod/widgets/gifs_grid.dart';

class TrendingGifsView extends HookConsumerWidget {
  const TrendingGifsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isLoadingMore = useState(false);
    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          if (!isLoadingMore.value) {
            ref.read(getTrendingGifsProvider.notifier).getMoreGifs();
            isLoadingMore.value = true;
          }
        }
      });
      return null;
    });
    return ref.watch(getTrendingGifsProvider).when(
          data: (data) {
            isLoadingMore.value = false;
            if (data.isEmpty) {
              return const Text("We couldn't get any gifs");
            }
            return GifsGrid(
              gifs: data,
              scrollController: scrollController,
              onLikeButtonTap: (isLiked, index) {
                ref.read(getTrendingGifsProvider.notifier).likeGif(isLiked, index);
              },
            );
          },
          error: (error, stackTrace) {
            final exception = error as CustomException;
            exception;
            return Text(exception.message);
          },
          loading: () => const LoaderIndicator(),
        );
  }
}
