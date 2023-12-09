import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoaderIndicator extends StatelessWidget {
  const LoaderIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: LoadingIndicator(
        indicatorType: Indicator.ballPulse,
        colors: [Colors.red],
        strokeWidth: 2,
        backgroundColor: Colors.white,
        pathBackgroundColor: Colors.black,
      ),
    );
  }
}
