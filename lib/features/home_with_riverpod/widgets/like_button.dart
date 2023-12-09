import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LikeButton extends HookWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLiked = useState(false);
    return InkWell(
      onTap: () {
        isLiked.value = !isLiked.value;
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
