import 'package:comicvine/features/home/domain/comic_model.dart';

class ComicRepository {
  ListComicModel deserializeResponse(Map<String, dynamic> data) {
    return ListComicModel.fromMap(data);
  }
}
