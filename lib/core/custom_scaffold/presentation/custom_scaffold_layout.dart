import 'package:comicvine/core/custom_scaffold/presentation/widgets/language_button.dart';
import 'package:comicvine/core/custom_scaffold/presentation/widgets/name_user.dart';
import 'package:comicvine/core/custom_scaffold/presentation/widgets/popup_menu.dart';
import 'package:comicvine/core/custom_scaffold/presentation/widgets/theme_button.dart';
import 'package:comicvine/core/custom_scaffold/presentation/widgets/user_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomScaffoldLayout extends StatelessWidget {
  final Widget widget;
  const CustomScaffoldLayout({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(child: Text(localizations.comicBook)),
        actions: const [
          NameUser(),
          LanguageButton(),
          ThemeButton(),
          UserButton(),
          PopupMenu()
        ],
      ),
      body: widget,
    );
  }
}
