import 'package:comicvine/features/detail_comic/data/detail_service.dart';
import 'package:comicvine/features/detail_comic/doamin/detail_comic_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_controller.g.dart';

@Riverpod(keepAlive: true)
Future<DetailComicModel> detailComic(DetailComicRef ref, int id) async {
  final DetailComicModel response = await DetailService().detailComic(id);
  // print(response.results!.first.toJson());
  return response;
}
