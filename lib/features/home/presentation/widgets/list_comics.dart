import 'package:comicvine/features/home/domain/comic_model.dart';
import 'package:comicvine/features/home/presentation/controllers/comic_controller.dart';
import 'package:comicvine/features/home/presentation/widgets/hover_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ListComics extends ConsumerStatefulWidget {
  final data;
  const ListComics({required this.data, super.key});

  @override
  ListComicsState createState() => ListComicsState();
}

class ListComicsState extends ConsumerState<ListComics> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(comicFetchProvider.notifier).updateComics();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final int crossAxisCount = MediaQuery.of(context).size.width ~/ 225;
    final double imageSize =
        MediaQuery.of(context).size.width / crossAxisCount - 10;
    final isList = ref.watch(isListProvider);

    // Usar el _scrollController en tu ListView.builder o GridView.builder
    return isList
        ? ListView.builder(
            controller: _scrollController,
            itemCount: widget.data.length + 1,
            itemBuilder: (context, index) {
              if (index < widget.data.length) {
                return _Comic(
                  comic: widget.data[index],
                  imageSize: imageSize,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        : GridView.builder(
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: size <= 1200 ? 0.68 : 0.73,
              crossAxisCount: size < 650 ? 2 : crossAxisCount,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemCount: widget.data.length + 1,
            itemBuilder: (context, index) {
              if (index < widget.data.length) {
                return _Comic(
                  comic: widget.data[index],
                  imageSize: size < 450 ? 140 : imageSize,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _Comic extends StatelessWidget {
  final Result comic;
  final double imageSize;
  const _Comic({super.key, required this.comic, required this.imageSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/comic/${comic.id}');
      },
      child: HoverCard(
        image: comic.image?.originalUrl,
        name: comic.volume?.name,
        imageSize: imageSize,
        dateAdded: comic.dateAdded,
        issueNumber: comic.issueNumber,
      ),
    );
  }
}
