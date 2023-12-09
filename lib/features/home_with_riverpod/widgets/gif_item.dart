import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/features/home_with_riverpod/widgets/like_button.dart';

class GifItem extends StatelessWidget {
  const GifItem({super.key, required this.gif, required this.index, required this.onLikeButtonTap});
  final GifEntity gif;
  final int index;
  final Function(bool) onLikeButtonTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: gif.original.url,
          height: gif.original.height,
          fit: BoxFit.fitHeight,
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: LikeButton(
            onTap: onLikeButtonTap,
            initialLikeState: gif.original.isLiked,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Text(index.toString()),
        )
      ],
    );
  }
}
