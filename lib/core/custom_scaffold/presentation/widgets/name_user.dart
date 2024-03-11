import 'package:comicvine/core/custom_scaffold/presentation/controller/credentials_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameUser extends ConsumerWidget {
  const NameUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(credentialsControllerProvider);
    final size = MediaQuery.of(context).size.width;
    return user == null
        ? Container()
        : Text(
            user.displayName!,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          );
  }
}
