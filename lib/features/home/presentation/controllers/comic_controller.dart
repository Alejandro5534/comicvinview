import 'dart:async';

import 'package:comicvine/core/data/api_constants.dart';
import 'package:comicvine/features/home/domain/comic_model.dart';
import 'package:comicvine/features/home/data/comic_service.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comic_controller.g.dart';

@Riverpod(keepAlive: true)
class ComicFetch extends _$ComicFetch {
  int numberComics = numberComicsPerRequest;
  @override
  Future<List<Result>> build() async {
    final response = await ComicService().listComic();
    final List<Result> responseList = response.results!;

    return responseList;
  }

  Future updateComics() async {
    numberComics = numberComics + numberComicsPerRequest;
    final response = await ComicService().updateListComicRequest(numberComics);
    final List<Result> responseList = response.results!;
    final previousState = await future;
    state = AsyncData([...previousState, ...responseList]);
  }
}

@riverpod
Future<List<Result>> comicsList(ComicsListRef ref) async {
  final lastList = ref.watch(currentListProvider);
  if (lastList.isEmpty) {
    final response = await ComicService().listComic();
    final List<Result> responseList = response.results!;
    ref.read(currentListProvider.notifier).changeList(responseList);
    return responseList;
  }
  final response = await ComicService().updateListComicRequest(lastList.length);
  final List<Result> responseList = response.results!;
  final newList = [...lastList, ...responseList];
  ref.read(currentListProvider.notifier).changeList(newList);
  return newList;
}

@Riverpod(keepAlive: true)
class IsList extends _$IsList {
  @override
  bool build() {
    return false;
  }

  void changeModeList() {
    state = !state;
  }
}

@riverpod
class CurrentList extends _$CurrentList {
  @override
  List<Result> build() {
    return [];
  }

  void changeList(List<Result> list) {
    state.addAll(list);
  }

  Future<List<Result>> updateList() async {
    final response = await ComicService().updateListComicRequest(state.length);
    final List<Result> responseList = response.results!;
    final newList = [...state, ...responseList];
    ref.read(currentListProvider.notifier).changeList(newList);
    return newList;
  }
}
