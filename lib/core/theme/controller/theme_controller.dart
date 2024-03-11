import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:comicvine/core/theme/app_theme.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeData build() {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark
        ? AppTheme().getDarkTheme()
        : AppTheme().getLightTheme();
  }

  void changeTheme() {
    state = state.brightness != Brightness.dark
        ? AppTheme().getDarkTheme()
        : AppTheme().getLightTheme();
  }
}
