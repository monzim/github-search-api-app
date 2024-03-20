// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchRepositoryHash() => r'771514aa1616a0076c421aef9d0d84ad949a9a4a';

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
String _$searTearmHash() => r'96a605fea18a913b2682585c1c3b8e690e9b03d1';

/// See also [SearTearm].
@ProviderFor(SearTearm)
final searTearmProvider =
    AutoDisposeNotifierProvider<SearTearm, String>.internal(
  SearTearm.new,
  name: r'searTearmProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searTearmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearTearm = AutoDisposeNotifier<String>;
String _$sortByHash() => r'7c5bf99da02132c7712f37081c9090f6b535ed6f';

/// See also [SortBy].
@ProviderFor(SortBy)
final sortByProvider = NotifierProvider<SortBy, InvalidType>.internal(
  SortBy.new,
  name: r'sortByProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sortByHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SortBy = Notifier<InvalidType>;
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
String _$searchLimitHash() => r'311b4727dd23d6092370725600b15278077ae7af';

/// See also [SearchLimit].
@ProviderFor(SearchLimit)
final searchLimitProvider =
    AutoDisposeNotifierProvider<SearchLimit, int>.internal(
  SearchLimit.new,
  name: r'searchLimitProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchLimitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchLimit = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
