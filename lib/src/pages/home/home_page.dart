import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:git_search/src/pages/home/sections/result_section.dart';
import 'package:git_search/src/pages/home/sections/searchbar_section.dart';
import 'package:git_search/src/services/git_search/provider/repository_search_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/home_provider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homePageProvider(isDebug: kDebugMode));
    final searchTerm = ref.watch(searchTermProvider);
    final scrollPosition = useState<double?>(null);
    final scrollController = useScrollController();
    final contoller = useTextEditingController(text: searchTerm);

    final showScrollToTop =
        scrollPosition.value != null && scrollPosition.value! > 600;

    ref.listen(searchTermProvider, (previous, next) {
      if (previous != next) {
        contoller.text = next;
      }
    });

    void scrollToTop() {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          ref.read(searchRepositoriesProvider.notifier).loadMore();
        }

        scrollPosition.value = scrollController.position.pixels;
      });

      return scrollController.dispose;
    }, [scrollController]);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SearchBarSection(contoller: contoller),
            const SliverToBoxAdapter(child: SizedBox(height: 6)),
            const ResultSection()
          ],
        ),
      ),
      floatingActionButton: !showScrollToTop
          ? null
          : FloatingActionButton(
              onPressed: scrollToTop,
              child: const Icon(Icons.arrow_upward),
            ),
    );
  }
}
