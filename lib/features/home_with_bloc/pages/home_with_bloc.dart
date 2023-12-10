import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:wizzer_test/features/home_with_bloc/cubit/search_by_name/search_by_name_cubit.dart';
import 'package:wizzer_test/features/home_with_bloc/cubit/trending_gifs/trending_gifs_cubit.dart';
import 'package:wizzer_test/features/home_with_bloc/views/search_results_view_bloc.dart';
import 'package:wizzer_test/features/home_with_bloc/views/trending_gifs_view_bloc.dart';

class HomeWithBloc extends HookWidget {
  const HomeWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final isSearching = useState(false);
    final textController = useTextEditingController();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TrendingGifsCubit(),
        ),
        BlocProvider(
          create: (context) => SearchByNameCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: const Text(
                'BLoC',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: CupertinoSearchTextField(
                            controller: textController,
                            placeholder: 'Search by name',
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                            ),
                            onTap: () {
                              isSearching.value = true;
                            },
                            onSuffixTap: () {
                              textController.clear();
                              isSearching.value = false;
                            },
                            onSubmitted: (value) {
                              context.read<SearchByNameCubit>().startSearchByName(value);
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            isSearching.value = false;
                            textController.clear();
                          },
                          icon: Icon(
                            Icons.trending_up_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: isSearching.value ? const SearchResultsViewBloc() : const TrendingGifsBlocView(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
