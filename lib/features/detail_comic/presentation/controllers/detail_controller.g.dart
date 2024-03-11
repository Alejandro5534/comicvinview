// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$detailComicHash() => r'4ec391c4db230ee1306834e7241816d3a6c0c7b2';

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

/// See also [detailComic].
@ProviderFor(detailComic)
const detailComicProvider = DetailComicFamily();

/// See also [detailComic].
class DetailComicFamily extends Family<AsyncValue<DetailComicModel>> {
  /// See also [detailComic].
  const DetailComicFamily();

  /// See also [detailComic].
  DetailComicProvider call(
    int id,
  ) {
    return DetailComicProvider(
      id,
    );
  }

  @override
  DetailComicProvider getProviderOverride(
    covariant DetailComicProvider provider,
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
  String? get name => r'detailComicProvider';
}

/// See also [detailComic].
class DetailComicProvider extends FutureProvider<DetailComicModel> {
  /// See also [detailComic].
  DetailComicProvider(
    int id,
  ) : this._internal(
          (ref) => detailComic(
            ref as DetailComicRef,
            id,
          ),
          from: detailComicProvider,
          name: r'detailComicProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$detailComicHash,
          dependencies: DetailComicFamily._dependencies,
          allTransitiveDependencies:
              DetailComicFamily._allTransitiveDependencies,
          id: id,
        );

  DetailComicProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<DetailComicModel> Function(DetailComicRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DetailComicProvider._internal(
        (ref) => create(ref as DetailComicRef),
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
  FutureProviderElement<DetailComicModel> createElement() {
    return _DetailComicProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DetailComicProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DetailComicRef on FutureProviderRef<DetailComicModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DetailComicProviderElement
    extends FutureProviderElement<DetailComicModel> with DetailComicRef {
  _DetailComicProviderElement(super.provider);

  @override
  int get id => (origin as DetailComicProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
