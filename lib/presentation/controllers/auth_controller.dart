import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit(){
    firebaseUser.bindStream(auth.authStateChanges());
    initializeGoogleSIgnIn();
    super.onInit();
  }

  Future<void>  initializeGoogleSIgnIn() async{
    try {
      await googleSignIn.initialize(
        serverClientId: '1042864166205-lculmalcgk1ed8vkidfqqt0hoaialqqj.apps.googleusercontent.com', //  firebase google key
      );   // ← MUST call before any operation
    } catch (e) {
      debugPrint('GoogleSignIn initialize error: $e');
    }
  }

  Future<void> signInWithGoogle() async{
    try{
      isLoading.value = true;
      final GoogleSignInAccount? googleAuth = await googleSignIn.authenticate();
      if(googleAuth == null) {
        Get.snackbar('Cancelled', 'Google sign-in cancelled');
      return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.email,
        idToken: googleAuth.id,
      );
      await auth.signInWithCredential(credential);
      Get.offAllNamed(AppRoutes.home);
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
    await googleSignIn.signOut();   // v7 mein bhi kaam karta hai
    Get.offAllNamed(AppRoutes.login);
  }
}