import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizzer_test/features/home_with_riverpod/providers/search_by_name_provider.dart';
import 'package:wizzer_test/features/home_with_riverpod/views/search_gifs_result_view.dart';
import 'package:wizzer_test/features/home_with_riverpod/views/trending_gifs_view.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearching = useState(false);
    final textController = useTextEditingController();
    return Scaffold(
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
                        ref.read(searchByNameProvider.notifier).searchByName(value);
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
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: isSearching.value ? const SearchGifsResultView() : const TrendingGifsView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
