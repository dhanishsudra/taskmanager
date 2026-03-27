import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/core/firebase/firebase_key.dart';


  class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance; //Firebase Auth ka official instance
  final GoogleSignIn googleSignIn = GoogleSignIn.instance; // ← singleton (no constructor)

  Rx<User?> firebaseUser = Rx<User?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // Firebase se real-time user changes sunta hai (login/logout detect karega)
    firebaseUser.bindStream(auth.authStateChanges());
    initializeGoogleSIgnIn(); // initialize must call before authenticate
    super.onInit();
  }

  Future<void> initializeGoogleSIgnIn() async {
    try {
      await googleSignIn.initialize(serverClientId: FirebaseKey.firebaseGoogleAuthKey);
      debugPrint('GoogleSignIn initialized successfully');
    } catch (e) {
      debugPrint('GoogleSignIn initialize error: $e');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      debugPrint('🔄 Google Sign-In started');
      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
      if (googleUser == null) {
        Get.snackbar('Cancelled', 'Google sign-in cancelled');
        return;
      }
      debugPrint('✅ Google tokens received');
      // Google se mila token ko Firebase ke liye credential mein convert karte hain
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: null,
        idToken: googleAuth.idToken,
      );
      debugPrint('Login email : ${credential.accessToken}');
      // Firebase mein actual login (ye user ko Firebase ke database mein register karta hai)
      await auth.signInWithCredential(credential);
      Get.offAllNamed(AppRoutes.home, predicate: (route) => false);
      Get.snackbar('Success', 'Google se login ho gaya!');
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    await googleSignIn.signOut();
    Get.offAllNamed(AppRoutes.login);
  }
}
