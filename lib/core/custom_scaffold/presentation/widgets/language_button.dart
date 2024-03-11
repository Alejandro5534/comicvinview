import 'package:comicvine/core/custom_scaffold/presentation/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    return TextButton(
      onPressed: () {
        ref.read(languageControllerProvider.notifier).changeLanguage();
      },
      child: Text(localizations.abrevationLanguage),
    );
  }
}
