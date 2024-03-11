import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static Future<User?> googleLogin({required BuildContext context}) async {
    await Firebase.initializeApp();
    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final UserCredential userCredential =
          await auth.signInWithPopup(googleAuthProvider);
      user = userCredential.user;

      return user;
    } on Exception catch (e) {
      print("Error al querer conectar con servicios de google $e");
    }
    return null;
  }

  Future logout() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
