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
String _$fetchRepositoryHash() => r'e5644909186faac946e64375f7bce5870bc08248';

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
String _$getRepoByIdHash() => r'4b73cee0389200cb2ef79d691f2c7240381730e1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getRepoById].
@ProviderFor(getRepoById)
const getRepoByIdProvider = GetRepoByIdFamily();

/// See also [getRepoById].
class GetRepoByIdFamily extends Family<GithubRepository?> {
  /// See also [getRepoById].
  const GetRepoByIdFamily();

  /// See also [getRepoById].
  GetRepoByIdProvider call(
    int? id,
  ) {
    return GetRepoByIdProvider(
      id,
    );
  }

  @override
  GetRepoByIdProvider getProviderOverride(
    covariant GetRepoByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getRepoByIdProvider';
}

/// See also [getRepoById].
class GetRepoByIdProvider extends AutoDisposeProvider<GithubRepository?> {
  /// See also [getRepoById].
  GetRepoByIdProvider(
    int? id,
  ) : this._internal(
          (ref) => getRepoById(
            ref as GetRepoByIdRef,
            id,
          ),
          from: getRepoByIdProvider,
          name: r'getRepoByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRepoByIdHash,
          dependencies: GetRepoByIdFamily._dependencies,
          allTransitiveDependencies:
              GetRepoByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetRepoByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int? id;

  @override
  Override overrideWith(
    GithubRepository? Function(GetRepoByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetRepoByIdProvider._internal(
        (ref) => create(ref as GetRepoByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<GithubRepository?> createElement() {
    return _GetRepoByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetRepoByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetRepoByIdRef on AutoDisposeProviderRef<GithubRepository?> {
  /// The parameter `id` of this provider.
  int? get id;
}

class _GetRepoByIdProviderElement
    extends AutoDisposeProviderElement<GithubRepository?> with GetRepoByIdRef {
  _GetRepoByIdProviderElement(super.provider);

  @override
  int? get id => (origin as GetRepoByIdProvider).id;
}

String _$errorMessageHash() => r'd97c9ae4fd0371b127203a255b736307c568583a';

/// See also [ErrorMessage].
@ProviderFor(ErrorMessage)
final errorMessageProvider =
    AutoDisposeNotifierProvider<ErrorMessage, String?>.internal(
  ErrorMessage.new,
  name: r'errorMessageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$errorMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ErrorMessage = AutoDisposeNotifier<String?>;
String _$searchTermHash() => r'23fc0d7eb871b740bfadc4fa2d3d3a39acbe0543';

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
    r'0f2d86ba63a45af27f5d6d9064cafd11c04941a6';

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
