import 'package:comicvine/core/data/api_constants.dart';
import 'package:comicvine/core/data/dio_client.dart';
import 'package:comicvine/features/detail_comic/doamin/detail_comic_model.dart';

class DetailService {
  Future<DetailComicModel> detailComic(int id) async {
    final response = await DioClient.httpGet('$specificComic$id/',
        {'api_key': apiKey, 'format': 'json', 'limit': '1'});

    final responseDeserialize = DetailComicModel.fromMap(response!.data);

    return responseDeserialize;
  }
}
