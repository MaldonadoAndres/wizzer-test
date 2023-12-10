import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizzer_test/core/widgets/loader_indicator.dart';
import 'package:wizzer_test/features/home_with_bloc/cubit/search_by_name/search_by_name_cubit.dart';
import 'package:wizzer_test/features/home_with_riverpod/widgets/gifs_grid.dart';

class SearchResultsViewBloc extends HookConsumerWidget {
  const SearchResultsViewBloc({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    bool isLoadingMore = false;
    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          if (!isLoadingMore) {
            context.read<SearchByNameCubit>().getMoreNamed();
            isLoadingMore = true;
          }
        }
      });
      return null;
    });
    return BlocBuilder<SearchByNameCubit, SearchByNameState>(
      builder: (context, state) {
        return state.when(
          searching: () => const LoaderIndicator(),
          error: (msg) => Text(msg),
          success: (gifs) {
            isLoadingMore = false;
            return Center(
              child: GifsGrid(
                gifs: gifs,
                scrollController: scrollController,
                onLikeButtonTap: (isLiked, index) {
                  context.read<SearchByNameCubit>().likeGif(isLiked, index);
                },
              ),
            );
          },
        );
      },
    );
  }
}
