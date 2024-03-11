import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'language_controller.g.dart';

@riverpod
class LanguageController extends _$LanguageController {
  @override
  bool build() => false;

  void changeLanguage() {
    state = !state;
  }
}
