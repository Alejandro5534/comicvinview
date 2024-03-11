import 'package:comicvine/core/custom_scaffold/data/google_auth.dart';
import 'package:comicvine/core/custom_scaffold/presentation/controller/credentials_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopupMenu extends ConsumerWidget {
  const PopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final userRef = ref.watch(credentialsControllerProvider);
    return PopupMenuButton(
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem(
            onTap: () async {
              final User? user = userRef == null
                  ? await AuthService.googleLogin(context: context)
                  : await AuthService().logout();

              ref.read(credentialsControllerProvider.notifier).changeUser(user);
            },
            child: Text(
                userRef != null ? localizations.singOut : localizations.singIn))
      ],
    );
  }
}
