import 'package:git_search/src/services/git_search/helper/github_search_helper.dart';
import 'package:git_search/src/services/git_search/model/enum.dart';
import 'package:git_search/src/services/git_search/model/github_repository.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_search_provider.g.dart';

@riverpod
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

  void update(int n) {
    state = n;
  }

  void increment() {
    state += 1;
  }
}

@riverpod
class SearchLimit extends _$SearchLimit {
  @override
  int build() {
    return 10;
  }

  void increment() {
    if (state == 1000) {
      state = 10;
    } else {
      state += 10;
    }
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
    // TODO: handle error
  }

  return res.$1;
}
