import 'package:comicvine/features/home/domain/comic_model.dart';
import 'package:comicvine/features/home/presentation/controllers/comic_controller.dart';
import 'package:comicvine/features/home/presentation/widgets/list_comics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeLayout extends ConsumerWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final isList = ref.watch(isListProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          const Divider(),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(localizations.lastestIssues),
              const Spacer(),
              IconButton(
                onPressed: () =>
                    ref.read(isListProvider.notifier).changeModeList(),
                icon: const Icon(Icons.list),
                style: isList
                    ? IconButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary)
                    : null,
              ),
              IconButton(
                onPressed: () =>
                    ref.read(isListProvider.notifier).changeModeList(),
                icon: const Icon(Icons.grid_on),
                style: isList
                    ? null
                    : IconButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          const Divider(),
          const Expanded(child: _StateListComic())
        ],
      ),
    );
  }
}

class _StateListComic extends ConsumerWidget {
  const _StateListComic({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comicsAsyncValue = ref.watch(comicFetchProvider);
    return comicsAsyncValue.when(
      data: (List<Result> data) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListComics(
            data: data,
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
