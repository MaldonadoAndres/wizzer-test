import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizzer_test/core/routes/router.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OutlinedButton(
              onPressed: () => context.push(kRiverpod),
              child: const Text('Go to Riverpod'),
            ),
            OutlinedButton(
              onPressed: () => context.push(kBloc),
              child: const Text('Go to BLoC'),
            ),
          ],
        ),
      ),
    );
  }
}
