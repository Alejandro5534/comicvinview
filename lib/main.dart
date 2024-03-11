import 'package:comicvine/core/custom_scaffold/presentation/controller/language_controller.dart';
import 'package:comicvine/core/data/dio_client.dart';
import 'package:comicvine/core/router/router.dart';
import 'package:comicvine/core/theme/controller/theme_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyD9iv4z-jmCI3akucVcY5e0dqHYhYNnILw",
        authDomain: "flutter-varios-74ae7.firebaseapp.com",
        databaseURL: "https://flutter-varios-74ae7-default-rtdb.firebaseio.com",
        projectId: "flutter-varios-74ae7",
        storageBucket: "flutter-varios-74ae7.appspot.com",
        messagingSenderId: "331317349047",
        appId: "1:331317349047:web:8034b266a4410245525b32",
        measurementId: "G-ZYQ2JS136X"),
  );
  DioClient.configureDio();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(themeControllerProvider);
    final language = ref.watch(languageControllerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      locale: language ? const Locale('en') : const Locale('es'),
      routerConfig: router,
      theme: theme,
    );
  }
}
