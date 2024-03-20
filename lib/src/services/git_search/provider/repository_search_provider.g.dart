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
String _$fetchRepositoryHash() => r'97425d08ab9e45a01639e50dc5a110acc50d479a';

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
String _$pageNumberHash() => r'043c62cbc29c94508a85782ca6d900a762cee5f0';

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
String _$searchLimitHash() => r'12d8db6ded9961c02378c22ac4d46883df4ecc1a';

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
    r'1bca5aa05e93286a12c217eddf51a55eddfaf21a';

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
