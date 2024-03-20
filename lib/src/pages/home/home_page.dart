import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:git_search/services/localization/extention/locale_extention.dart';
import 'package:git_search/src/pages/home/widgets/repo_card_w.dart';
import 'package:git_search/src/services/git_search/provider/repository_search_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/services/routers/app_router.dart';
import 'providers/home_provider.dart';
import 'widgets/shimmer_card_w.dart';
import 'widgets/sort_button_w.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homePageProvider(isDebug: kDebugMode));
    final searchTerm = ref.watch(searchTermProvider);

    final scrollController = useScrollController();
    final contoller =
        useTextEditingController(text: ref.read(searchTermProvider));
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
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            title: SearchBar(
              hintText: 'Search',
              controller: contoller,
              elevation: MaterialStateProperty.all<double>(1),
              onSubmitted: (value) {
                ref
                    .read(searchRepositoriesProvider.notifier)
                    .searchWithTerm(value);
              },
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15)),
              leading: const Icon(Icons.search),
            ),
            // title: Text(
            //   context.l10n.appTitle,
            //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //         color: Theme.of(context).colorScheme.primary,
            //         fontWeight: FontWeight.bold,
            //       ),
            // ),
            // backgroundColor: Colors.transparent,
            actions: [
              const SortingChooseButton(),
              IconButton.filledTonal(
                onPressed: () => const SettingsRoute().push(context),
                icon: const Icon(Icons.settings),
              ),
            ],
            pinned: false,
            expandedHeight: 250,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              collapseMode: CollapseMode.parallax,
              title: Text(
                context.l10n.appTitle,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 20,
                ),
              ),
              background: const Image(
                image: NetworkImage(
                    'https://cdn-monzim-com.azureedge.net/blog/a92b9ec0-cc8c-11ee-9b9b-4d4cad20df55'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 6)),
          if (initialLoading)
            SliverToBoxAdapter(child: ShimmerList(count: limit))
          else if (repositories.isEmpty)
            if (loading)
              SliverToBoxAdapter(child: ShimmerList(count: limit))
            else
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 120,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'No repositories found for $searchTerm',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                addAutomaticKeepAlives: true,
                childCount:
                    loading ? repositories.length + 1 : repositories.length,
                (context, index) {
                  if (index < repositories.length) {
                    final repo = repositories.elementAt(index);
                    final i = index + 1;

                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RepoCardWidget(
                        key: ValueKey(repo.id),
                        repository: repo,
                        index: i,
                      ),
                    );
                  }

                  return ShimmerList(count: limit);
                },
              ),
            ),
        ],
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
