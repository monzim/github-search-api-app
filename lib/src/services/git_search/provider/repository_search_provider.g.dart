// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isInitialLoadingHash() => r'170ac7e3eceb7038d7dad85bfd12e42dcc5ba6d5';

/// See also [isInitialLoading].
@ProviderFor(isInitialLoading)
final isInitialLoadingProvider = AutoDisposeProvider<bool>.internal(
  isInitialLoading,
  name: r'isInitialLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isInitialLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsInitialLoadingRef = AutoDisposeProviderRef<bool>;
String _$fetchRepositoryHash() => r'6e8c76a4574f50d7225237393831c9fca750f992';

/// See also [fetchRepository].
@ProviderFor(fetchRepository)
final fetchRepositoryProvider =
    AutoDisposeFutureProvider<List<GithubRepository>>.internal(
  fetchRepository,
  name: r'fetchRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchRepositoryRef
    = AutoDisposeFutureProviderRef<List<GithubRepository>>;
String _$searTearmHash() => r'c3c9612b20353ea6b22b0e46034603dee3adfad0';

/// See also [SearTearm].
@ProviderFor(SearTearm)
final searTearmProvider = NotifierProvider<SearTearm, String>.internal(
  SearTearm.new,
  name: r'searTearmProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searTearmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearTearm = Notifier<String>;
String _$sortByHash() => r'7c5bf99da02132c7712f37081c9090f6b535ed6f';

/// See also [SortBy].
@ProviderFor(SortBy)
final sortByProvider = NotifierProvider<SortBy, Sort>.internal(
  SortBy.new,
  name: r'sortByProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sortByHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SortBy = Notifier<Sort>;
String _$pageNumberHash() => r'729468bbaaebb1b3f8bee03652dcc660e4d79bfb';

/// See also [PageNumber].
@ProviderFor(PageNumber)
final pageNumberProvider = NotifierProvider<PageNumber, int>.internal(
  PageNumber.new,
  name: r'pageNumberProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pageNumberHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PageNumber = Notifier<int>;
String _$searchLimitHash() => r'9f4c23393106db5479b03f5cf93d2959e233ec50';

/// See also [SearchLimit].
@ProviderFor(SearchLimit)
final searchLimitProvider = NotifierProvider<SearchLimit, int>.internal(
  SearchLimit.new,
  name: r'searchLimitProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchLimitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchLimit = Notifier<int>;
String _$searchRepositoriesHash() =>
    r'198729ac2ecbe589dd8edb3723ad27823f9d2193';

/// See also [SearchRepositories].
@ProviderFor(SearchRepositories)
final searchRepositoriesProvider = NotifierProvider<SearchRepositories,
    (List<GithubRepository>, bool)>.internal(
  SearchRepositories.new,
  name: r'searchRepositoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchRepositoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchRepositories = Notifier<(List<GithubRepository>, bool)>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
