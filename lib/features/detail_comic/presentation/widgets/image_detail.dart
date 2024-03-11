import 'package:comicvine/features/detail_comic/doamin/detail_comic_model.dart';
import 'package:flutter/material.dart';

class ImageComicDetail extends StatelessWidget {
  const ImageComicDetail({
    super.key,
    required this.comic,
  });

  final Results comic;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Image.network(comic.image!.originalUrl!),
    ));
  }
}
