import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LikeButton extends HookWidget {
  const LikeButton({
    super.key,
    required this.onTap,
    required this.initialLikeState,
  });
  final Function(bool) onTap;
  final bool initialLikeState;

  @override
  Widget build(BuildContext context) {
    final isLiked = useState(initialLikeState);
    return InkWell(
      onTap: () {
        isLiked.value = !isLiked.value;
        onTap(isLiked.value);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isLiked.value ? Colors.red : Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isLiked.value ? Icons.favorite : Icons.favorite_border,
          color: isLiked.value ? Colors.white : Colors.red,
          size: 20.0,
        ),
      ),
    );
  }
}
