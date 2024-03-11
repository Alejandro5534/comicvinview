import 'package:flutter/material.dart';

class ImageComic extends StatelessWidget {
  final double imageSize;
  final String? image;
  const ImageComic({super.key, required this.imageSize, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageSize,
      child: image == null
          ? const Icon(Icons.info)
          : Image.network(
              image!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.info),
            ),
    );
  }
}
