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

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homePageProvider(isDebug: kDebugMode));

    final sort = ref.watch(sortByProvider);
    final limit = ref.watch(searchLimitProvider);
    final data = ref.watch(searchRepositoriesProvider);
    final repositories = data.$1;
    final loading = data.$2;

    final initialLoading = ref.watch(isInitialLoadingProvider);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          ref.read(searchRepositoriesProvider.notifier).loadMore();
        }
      });

      return scrollController.dispose;
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        actions: [
          IconButton(
            onPressed: () => const SettingsRoute().push(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(searchRepositoriesProvider.notifier).loadMore();
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5),
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
                          child: RepoCardWidget(repository: repo, index: i),
                        );
                      }

                      return ShimmerList(count: limit);
                    },
                  )),
      ),
    );
  }
}
