import 'dart:convert';

import 'package:git_search/services/local_storage/isar/constants/isar_constants.dart';
import 'package:git_search/services/local_storage/isar/providers/isar_provider.dart';
import 'package:git_search/src/services/cache/cache_model.dart';
import 'package:git_search/src/services/git_search/model/github_repository.dart';
import 'package:git_search/src/services/git_search/provider/repository_search_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_provider.g.dart';

@Riverpod(keepAlive: true)
class AppCache extends _$AppCache {
  @override
  Future<CacheModel> build() async {
    final cache = await _getData();

    ref.read(pageNumberProvider.notifier).update(cache.lastPage);
    ref.read(searchLimitProvider.notifier).change(cache.perPage);
    return cache;
  }

  static List<GithubRepository> getAsRepo(CacheModel cache) {
    late List<GithubRepository> list = [];
    if (cache.json != null) {
      final json = jsonDecode(cache.json!);

      if (json is List) {
        list = json.map((e) => GithubRepository.fromJson(e)).toList();
      }
    }

    return list;
  }

  Future<void> addData(
    List<GithubRepository> data, {
    required int limit,
    required int page,
  }) async {
    final prev = await _getData();

    late List<GithubRepository> list = [];
    if (prev.json != null) {
      final json = jsonDecode(prev.json!);

      if (json is List) {
        list = json.map((e) => GithubRepository.fromJson(e)).toList();
      }
    }

    list.addAll(data);
    list = list.toSet().toList();
    list.sort((a, b) {
      int bS = b.stargazersCount ?? 0;
      int aS = a.stargazersCount ?? 0;

      return bS.compareTo(aS);
    });

    prev.json = jsonEncode(list);
    prev.lastUpdated = DateTime.now();
    prev.lastPage = page;
    prev.perPage = limit;

    _update(prev);
  }

  void reset() {
    final cache = CacheModel();
    _update(cache);
  }

  void _update(CacheModel? cache) {
    if (cache != null) {
      _save(cache);
      state = AsyncValue.data(cache);
    }
  }

  Future<CacheModel> _getData() async {
    final isar = await ref.read(isarServiceProvider.future);
    final oldCache =
        await isar?.cacheModels.get(IsarConstantsCollections.cache);

    if (oldCache != null) {
      return oldCache;
    }

    final newCache = CacheModel();
    _save(newCache);

    return newCache;
  }

  Future<void> _save(CacheModel preferences) async {
    final isar = await ref.read(isarServiceProvider.future);
    await isar?.writeTxn(() async => isar.cacheModels.put(preferences));
  }
}
