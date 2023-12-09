import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizzer_test/core/widgets/loader_indicator.dart';
import 'package:wizzer_test/features/home_with_riverpod/providers/get_trending_gifs_provider.dart';
import 'package:wizzer_test/features/home_with_riverpod/widgets/gif_item.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        // ref.read(getTrendingGifsProvider.notifier).getMoreGifs();
      }
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(getTrendingGifsProvider.notifier).getMoreGifs();
      }),
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: ref.watch(getTrendingGifsProvider).when(
                data: (data) {
                  return MasonryGridView.builder(
                    controller: scrollController,
                    itemCount: data.length,
                    gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final gif = data[index];
                      return GifItem(gif: gif);
                    },
                  );
                },
                error: (error, stackTrace) => Container(),
                loading: () => const LoaderIndicator(),
              ),
        ),
      ),
    );
  }
}
