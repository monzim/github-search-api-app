import 'package:git_search/src/services/cache/cache_provider.dart';
import 'package:git_search/src/services/git_search/helper/github_search_helper.dart';
import 'package:git_search/src/services/git_search/model/enum.dart';
import 'package:git_search/src/services/git_search/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_search_provider.g.dart';

@Riverpod(keepAlive: true)
class SearTearm extends _$SearTearm {
  @override
  String build() {
    return 'Flutter';
  }

  void change(String s) {
    state = s;
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
    return ([], false);
  }

  void add(List<GithubRepository> list) =>
      state = ([...state.$1, ...list], state.$2);
  void clear() => state = ([], false);
  void _toggleLoading() => state = (state.$1, !state.$2);

  Future<void> _loadInitialData() async {
    final cache = await ref.read(appCacheProvider.future);
    final data = AppCache.getAsRepo(cache);
    add(data);

    if (data.isEmpty) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    try {
      _toggleLoading();
      final res = await ref.read(fetchRepositoryProvider.future);
      add(res);
    } finally {
      _toggleLoading();
    }
  }

  void loadMore() {
    _toggleLoading();
    ref.read(pageNumberProvider.notifier).increment();
    _loadData();
  }
}

@riverpod
Future<List<GithubRepository>> fetchRepository(FetchRepositoryRef ref) async {
  final term = ref.watch(searTearmProvider);
  final page = ref.watch(pageNumberProvider);
  final limit = ref.watch(searchLimitProvider);

  final res = await ref.read(githubSearchRepositoryProvider).search(
        query: term,
        page: page,
        perPage: limit,
      );

  if (res.$2 != null) {
    throw Exception(res.$2);
  }

  ref.read(appCacheProvider.notifier).addData(res.$1, limit: limit, page: page);
  return res.$1;
}
