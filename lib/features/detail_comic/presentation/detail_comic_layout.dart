import 'package:comicvine/features/detail_comic/doamin/detail_comic_model.dart';
import 'package:comicvine/features/detail_comic/presentation/controllers/detail_controller.dart';
import 'package:comicvine/features/detail_comic/presentation/widgets/image_detail.dart';
import 'package:comicvine/features/detail_comic/presentation/widgets/subtitle_detail.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailComicLayout extends ConsumerStatefulWidget {
  final int id;
  const DetailComicLayout({super.key, required this.id});

  @override
  DetailComicLayoutState createState() => DetailComicLayoutState();
}

class DetailComicLayoutState extends ConsumerState<DetailComicLayout> {
  @override
  Widget build(BuildContext context) {
    final detailComic = ref.watch(detailComicProvider(widget.id));
    final size = MediaQuery.of(context).size.width;
    return detailComic.when(
      data: (data) {
        // print(data.results?.first.characterCredits?.first.name);
        return size < 680
            ? _MobileView(dataComic: data)
            : _DeskView(dataComic: data);
      },
      error: (error, stackTrace) {
        print(error);
        return Center(
          child: TextButton(
            onPressed: () {},
            child: const Text('Sorry'),
          ),
        );
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class _DeskView extends StatelessWidget {
  final DetailComicModel dataComic;
  const _DeskView({super.key, required this.dataComic});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final comic = dataComic.results!;

    return Row(children: [
      Flexible(
          flex: 1,
          child: _SubtitlesDetail(localizations: localizations, comic: comic)),
      Flexible(flex: 1, child: ImageComicDetail(comic: comic))
    ]);
  }
}

class _MobileView extends StatelessWidget {
  final DetailComicModel dataComic;
  const _MobileView({super.key, required this.dataComic});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final comic = dataComic.results!;
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.network(
                comic.image!.originalUrl!,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: SubtitleDetail(
            subtitle: localizations.characters,
            empty: localizations.emptyCharacters,
            comic: comic.characterCredits!,
          ),
        ),
        Flexible(
          flex: 1,
          child: SubtitleDetail(
            subtitle: localizations.teams,
            empty: localizations.emptyTeams,
            comic: comic.teamCredits!,
          ),
        ),
        Flexible(
          flex: 1,
          child: SubtitleDetail(
            subtitle: localizations.locations,
            empty: localizations.emptyLocations,
            comic: comic.locationCredits!,
          ),
        ),
      ],
    );
  }
}

class _SubtitlesDetail extends StatelessWidget {
  const _SubtitlesDetail({
    super.key,
    required this.localizations,
    required this.comic,
  });

  final AppLocalizations localizations;
  final Results comic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: SubtitleDetail(
            subtitle: localizations.characters,
            empty: localizations.emptyCharacters,
            comic: comic.characterCredits!,
          ),
        ),
        Flexible(
          flex: 1,
          child: SubtitleDetail(
            subtitle: localizations.teams,
            empty: localizations.emptyTeams,
            comic: comic.teamCredits!,
          ),
        ),
        Flexible(
          flex: 1,
          child: SubtitleDetail(
            subtitle: localizations.locations,
            empty: localizations.emptyLocations,
            comic: comic.locationCredits!,
          ),
        ),
      ],
    );
  }
}
