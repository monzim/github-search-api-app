import 'dart:async';

import 'package:git_search/src/services/cache/cache_provider.dart';
import 'package:git_search/src/services/git_search/helper/github_search_helper.dart';
import 'package:git_search/src/services/git_search/model/enum.dart';
import 'package:git_search/src/services/git_search/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_search_provider.g.dart';

@riverpod
class ErrorMessage extends _$ErrorMessage {
  @override
  String? build() {
    return null;
  }

  void change(String? s) {
    state = s;
  }
}

@Riverpod(keepAlive: true)
class SearchTerm extends _$SearchTerm {
  static const initial = 'Flutter';

  @override
  String build() {
    return initial;
  }

  void change(String? s) {
    state = s ?? initial;
  }
}

@Riverpod(keepAlive: true)
class SortBy extends _$SortBy {
  @override
  Sort build() {
    return Sort.stars;
  }

  void change(Sort sort) {
    state = sort;
  }
}

@Riverpod(keepAlive: true)
class PageNumber extends _$PageNumber {
  @override
  int build() {
    return 1;
  }

  void update(int? n) {
    state = n ?? 1;
  }

  void increment() {
    state += 1;
  }
}

@Riverpod(keepAlive: true)
class SearchLimit extends _$SearchLimit {
  static const initial = 10;
  static const up = 10;
  static const max = 100;

  @override
  int build() {
    return initial;
  }

  void change(int? n) {
    state = n ?? initial;
    ref.read(appCacheProvider.notifier).updateSearchLimit(n ?? initial);
  }
}

@riverpod
bool isInitialLoading(IsInitialLoadingRef ref) {
  final page = ref.watch(pageNumberProvider);
  final loading = ref.watch(searchRepositoriesProvider).$2;
  return page == 1 && loading;
}

@Riverpod(keepAlive: true)
class SearchRepositories extends _$SearchRepositories {
  @override
  (List<GithubRepository>, bool) build() {
    _loadInitialData();
    revalidate();

    return ([], false);
  }

  void clear() {
    state = ([], false);
    ref.invalidate(pageNumberProvider);
    ref.read(appCacheProvider.notifier).reset();
  }

  void _toggleLoading(bool b) => state = (state.$1, b);

  void add(List<GithubRepository> list) {
    state = ([...state.$1, ...list], state.$2);
  }

  Future<void> _loadInitialData() async {
    final cache = await ref.read(appCacheProvider.future);
    final data = AppCache.getAsRepo(cache);
    add(data);

    if (data.isEmpty) {
      _loadData();
    }
  }

  void sortItems(Sort sort) {
    final data = state.$1;

    data.sort((a, b) {
      switch (sort) {
        case Sort.stars:
          {
            final aC = a.stargazersCount ?? 0;
            final bC = b.stargazersCount ?? 0;
            return bC.compareTo(aC);
          }
        case Sort.forks:
          {
            final aC = a.forksCount ?? 0;
            final bC = b.forksCount ?? 0;
            return bC.compareTo(aC);
          }
        case Sort.updated:
          {
            final aC = a.updatedAt?.microsecondsSinceEpoch ?? 0;
            final bC = b.updatedAt?.microsecondsSinceEpoch ?? 0;
            return bC.compareTo(aC);
          }
      }
    });

    state = (data, state.$2);
  }

  void loadMore() {
    ref.read(pageNumberProvider.notifier).increment();
    _loadData();
  }

  void searchWithTerm(String term) {
    ref.read(pageNumberProvider.notifier).update(1);
    ref.read(searchTermProvider.notifier).change(term);
    clear();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      _toggleLoading(true);
      final res = await ref.read(fetchRepositoryProvider.future);
      add(res);
    } finally {
      _toggleLoading(false);
    }
  }

  void revalidate() {
    Timer(const Duration(minutes: 30), () {
      clear();
      _loadInitialData();

      ref.read(searchRepositoriesProvider.notifier).revalidate();
    });
  }
}

@riverpod
Future<List<GithubRepository>> fetchRepository(FetchRepositoryRef ref) async {
  final term = ref.watch(searchTermProvider);
  final page = ref.watch(pageNumberProvider);
  final limit = ref.watch(searchLimitProvider);

  final res = await ref.read(githubSearchRepositoryProvider).search(
        query: term,
        page: page,
        perPage: limit,
      );

  if (res.$2 != null) {
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    ref.read(errorMessageProvider.notifier).change(res.$2);
  }

// save to cache
  ref.read(appCacheProvider.notifier).addData(
        res.$1,
        limit: limit,
        page: page,
        query: term,
      );

  return res.$1;
}

@riverpod
GithubRepository? getRepoById(GetRepoByIdRef ref, int? id) {
  final data = ref.watch(searchRepositoriesProvider).$1;
  if (id == null) {
    return null;
  }

  return data.firstWhere((e) => e.id == id);
}
