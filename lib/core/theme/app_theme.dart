import 'package:flutter/material.dart';

class AppTheme {
  static final AppTheme _instancia = AppTheme._interno();

  AppTheme._interno();

  factory AppTheme() {
    return _instancia;
  }
  ThemeData getLightTheme() {
    ThemeData baseThemeLight = ThemeData(
      colorSchemeSeed: Colors.red,
      brightness: Brightness.light,
      fontFamily: 'Cartoonist',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 23),
      ),
      scrollbarTheme: const ScrollbarThemeData()
          .copyWith(thumbColor: MaterialStateProperty.all(Colors.blueGrey)),
    );

    Color backgroundColor =
        getAdjustedBackgroundColor(baseThemeLight.colorScheme.primary);

    return baseThemeLight.copyWith(
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: baseThemeLight.colorScheme.copyWith(),
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.blueGrey,
      fontFamily: 'Cartoonist',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 23),
      ),
      scrollbarTheme: const ScrollbarThemeData()
          .copyWith(thumbColor: MaterialStateProperty.all(Colors.blueGrey)),
    );
  }

  Color getAdjustedBackgroundColor(Color color) {
    return HSLColor.fromColor(color)
        .withLightness(
            (HSLColor.fromColor(color).lightness + 0.1).clamp(0.0, 1.0))
        .toColor()
        .withOpacity(0.05);
  }
}
