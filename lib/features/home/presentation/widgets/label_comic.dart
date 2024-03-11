import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LabelComic extends StatelessWidget {
  final String? name;
  final String? issueNumber;
  final DateTime? dateAdded;
  const LabelComic(
      {super.key,
      required this.name,
      required this.dateAdded,
      required this.issueNumber});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    Locale locale = Localizations.localeOf(context);
    return Column(
      children: [
        name == null
            ? Text(localizations.unknownName)
            : Text('$name #$issueNumber', overflow: TextOverflow.ellipsis),
        Text(
          dateAdded == null
              ? localizations.unknownDate
              : DateFormat('MMMM dd, yyyy', locale.toString())
                  .format(dateAdded!)
                  .toString(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall!.fontSize),
        ),
      ],
    );
  }
}
