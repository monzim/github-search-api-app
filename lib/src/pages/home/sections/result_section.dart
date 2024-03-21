import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:git_search/src/pages/home/widgets/repo_card_w.dart';
import 'package:git_search/src/pages/home/widgets/shimmer_card_w.dart';
import 'package:git_search/src/services/git_search/provider/repository_search_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResultSection extends HookConsumerWidget {
  const ResultSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTerm = ref.watch(searchTermProvider);
    final data = ref.watch(searchRepositoriesProvider);
    final limit = ref.watch(searchLimitProvider);
    final initialLoading = ref.watch(isInitialLoadingProvider);

    final repositories = data.$1;
    final loading = data.$2;

    final error = ref.watch(errorMessageProvider);

    ref.listen(errorMessageProvider, (previous, next) {
      if (previous != next) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next ?? ''),
            duration: const Duration(seconds: 8),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    });

    if (initialLoading || (repositories.isEmpty && loading)) {
      return SliverToBoxAdapter(child: ShimmerList(count: limit));
    } else if (repositories.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.search_off,
                  size: 160,
                  color: Theme.of(context).colorScheme.primary,
                ).animate(
                  onComplete: (controller) {
                    controller.forward(from: 0);
                  },
                ).shake(
                  rotation: 0.1,
                  duration: const Duration(milliseconds: 1000),
                  hz: 1,
                  offset: const Offset(0.01, 0),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    error ?? 'No repositories found for $searchTerm',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        addAutomaticKeepAlives: true,
        childCount: loading ? repositories.length + 1 : repositories.length,
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
    );
  }
}
