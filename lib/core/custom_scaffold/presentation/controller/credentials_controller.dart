import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credentials_controller.g.dart';

@riverpod
class CredentialsController extends _$CredentialsController {
  @override
  User? build() {
    return null;
  }

  void changeUser(User? user) {
    state = user;
  }
}
