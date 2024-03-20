import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:git_search/src/pages/home/widgets/repo_card_w.dart';
import 'package:git_search/src/services/git_search/provider/repository_search_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/services/routers/app_router.dart';
import '/src/global/global.dart';
import 'providers/home_provider.dart';
import 'widgets/shimmer_card_w.dart';
import 'widgets/sort_button_w.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homePageProvider(isDebug: kDebugMode));
    final scrollController = useScrollController();
    final scrollPosition = useState<double?>(null);

    final limit = ref.watch(searchLimitProvider);
    final data = ref.watch(searchRepositoriesProvider);
    final initialLoading = ref.watch(isInitialLoadingProvider);

    final repositories = data.$1;
    final loading = data.$2;

    final showScrollToTop =
        scrollPosition.value != null && scrollPosition.value! > 600;

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
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        actions: [
          const SortingChooseButton(),
          IconButton(
            onPressed: () => const SettingsRoute().push(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: !showScrollToTop
          ? null
          : FloatingActionButton(
              onPressed: scrollToTop,
              child: const Icon(Icons.arrow_upward),
            ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(searchRepositoriesProvider.notifier).loadMore();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: initialLoading
              ? ShimmerList(count: limit)
              : ListView.builder(
                  controller: scrollController,
                  itemCount:
                      loading ? repositories.length + 1 : repositories.length,
                  itemBuilder: (context, index) {
                    if (index < repositories.length) {
                      final repo = repositories.elementAt(index);
                      final i = index + 1;

                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: RepoCardWidget(
                            key: ValueKey(repo.id), repository: repo, index: i),
                      );
                    }

                    return ShimmerList(count: limit);
                  },
                ),
        ),
      ),
    );
  }
}
