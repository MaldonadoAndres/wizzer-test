import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/features/home_with_riverpod/widgets/like_button.dart';

class GifItem extends StatelessWidget {
  const GifItem({super.key, required this.gif});
  final GifEntity gif;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: CachedNetworkImage(
            imageUrl: gif.original.url,
            height: gif.original.height,
            fit: BoxFit.fitHeight,
          ),
        ),
        const Positioned(
          bottom: 10,
          right: 10,
          child: LikeButton(),
        )
      ],
    );
  }
}
