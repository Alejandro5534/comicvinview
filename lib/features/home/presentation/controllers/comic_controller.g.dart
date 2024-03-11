// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$comicsListHash() => r'aef0e2998579ac886e330afe36d4154519f9df4f';

/// See also [comicsList].
@ProviderFor(comicsList)
final comicsListProvider = AutoDisposeFutureProvider<List<Result>>.internal(
  comicsList,
  name: r'comicsListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$comicsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ComicsListRef = AutoDisposeFutureProviderRef<List<Result>>;
String _$comicFetchHash() => r'7f59be1b843451a7b339527c12ec1ce3678dd7b6';

/// See also [ComicFetch].
@ProviderFor(ComicFetch)
final comicFetchProvider =
    AsyncNotifierProvider<ComicFetch, List<Result>>.internal(
  ComicFetch.new,
  name: r'comicFetchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$comicFetchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ComicFetch = AsyncNotifier<List<Result>>;
String _$isListHash() => r'815fecabcc45bd718ef980a5da0438afb4b33c39';

/// See also [IsList].
@ProviderFor(IsList)
final isListProvider = NotifierProvider<IsList, bool>.internal(
  IsList.new,
  name: r'isListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsList = Notifier<bool>;
String _$currentListHash() => r'538599e5194f3bc1afa7c319d7e0d28b7963acf8';

/// See also [CurrentList].
@ProviderFor(CurrentList)
final currentListProvider =
    AutoDisposeNotifierProvider<CurrentList, List<Result>>.internal(
  CurrentList.new,
  name: r'currentListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentList = AutoDisposeNotifier<List<Result>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
