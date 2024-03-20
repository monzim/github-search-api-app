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
String _$searchTermHash() => r'e2aec4d584ae34c2ab7dbe61a4c834c868707d4a';

/// See also [SearchTerm].
@ProviderFor(SearchTerm)
final searchTermProvider = NotifierProvider<SearchTerm, String>.internal(
  SearchTerm.new,
  name: r'searchTermProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchTermHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchTerm = Notifier<String>;
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
    r'd847fc725bebdb84ed382c07c9de7e29bb9fdb12';

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
