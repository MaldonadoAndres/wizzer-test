import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/features/home_with_riverpod/widgets/gif_item.dart';

class GifsGrid extends StatelessWidget {
  const GifsGrid({super.key, required this.gifs, required this.scrollController, required this.onLikeButtonTap});
  final List<GifEntity> gifs;
  final ScrollController scrollController;
  final Function(bool, int) onLikeButtonTap;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      controller: scrollController,
      itemCount: gifs.length,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final gif = gifs[index];
        return GifItem(
          gif: gif,
          index: index,
          onLikeButtonTap: (isLiked) {
            onLikeButtonTap(isLiked, index);
          },
        );
      },
    );
  }
}
