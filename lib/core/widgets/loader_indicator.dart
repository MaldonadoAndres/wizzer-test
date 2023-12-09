import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoaderIndicator extends StatelessWidget {
  const LoaderIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: LoadingIndicator(
        indicatorType: Indicator.ballPulse,
        colors: [Theme.of(context).primaryColor],
        strokeWidth: 2,
        backgroundColor: Colors.transparent,
        pathBackgroundColor: Colors.transparent,
      ),
    );
  }
}
