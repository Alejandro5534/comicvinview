import 'package:comicvine/core/custom_scaffold/data/google_auth.dart';
import 'package:comicvine/core/custom_scaffold/presentation/controller/credentials_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserButton extends ConsumerWidget {
  const UserButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(credentialsControllerProvider);
    return user != null
        ? Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ClipOval(
                child: Image.network(
              user.photoURL!,
              height: 30,
            )),
          )
        : IconButton(
            onPressed: () async {
              final User? user =
                  await AuthService.googleLogin(context: context);

              ref.read(credentialsControllerProvider.notifier).changeUser(user);
            },
            icon: const Icon(Icons.person));
  }
}
