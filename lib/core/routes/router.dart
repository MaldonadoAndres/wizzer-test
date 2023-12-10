import 'package:go_router/go_router.dart';
import 'package:wizzer_test/features/home_with_bloc/pages/home_with_bloc.dart';
import 'package:wizzer_test/features/home_with_riverpod/pages/home_page.dart';
import 'package:wizzer_test/features/selection_screen/selection_screen.dart';

const String kRoot = '/';
const String kRiverpod = '/riverpod';
const String kBloc = '/bloc';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: kRoot,
      builder: (context, state) => const SelectionScreen(),
    ),
    GoRoute(
      path: kRiverpod,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: kBloc,
      builder: (context, state) => const HomeWithBloc(),
    ),
  ],
);
