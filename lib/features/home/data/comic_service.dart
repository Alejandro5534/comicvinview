import 'package:comicvine/core/data/api_constants.dart';
import 'package:comicvine/core/data/dio_client.dart';
import 'package:comicvine/features/home/domain/comic_model.dart';
import 'package:comicvine/features/home/domain/comic_repository.dart';

class ComicService {
  Future<ListComicModel> listComic() async {
    final response = await DioClient.httpGet(comicList, {
      'api_key': apiKey,
      'format': 'json',
      'limit': '$numberComicsPerRequest'
    });

    final ListComicModel listComicModel =
        ComicRepository().deserializeResponse(response!.data);

    return listComicModel;
  }

  Future<ListComicModel> updateListComicRequest(int offset) async {
    final response = await DioClient.httpGet(
      comicList,
      {
        'api_key': apiKey,
        'format': 'json',
        'limit': '$numberComicsPerRequest',
        'offset': '$offset',
      },
    );

    final ListComicModel listComicModel =
        ComicRepository().deserializeResponse(response!.data);

    return listComicModel;
  }
}
