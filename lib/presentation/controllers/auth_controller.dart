import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/domain/models/user_entity.dart';
import 'package:task_manager/domain/repositories/auth_repository_impl.dart';
import 'package:task_manager/domain/usecases/login_use_case.dart';
import 'package:task_manager/domain/usecases/logout_use_case.dart';


class AuthController extends GetxController{

  late final LoginUseCase loginUseCase;
  late final LogoutUseCase logoutUseCase;

  final Rx<UserEntity?> currentUser = Rx<UserEntity?>(null);
  final RxBool isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    final authRepository = AuthRepositoryImpl(_auth);

    loginUseCase = LoginUseCase(authRepository);
    logoutUseCase = LogoutUseCase(authRepository);

    // Real-time user changes
    authRepository.authStateChanges.listen((user) {
      currentUser.value = user;
    });
    super.onInit();
  }



  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      print('🔄 Google Sign-In started');

      await _googleSignIn.signOut(); // fresh attempt

      final  googleAuth =
      await _googleSignIn.signIn();

      if (googleAuth == null) {
        print('User cancelled Google sign-in');
        Get.snackbar('Cancelled', 'Sign-in cancel ho gaya');
        return;
      }

      print('✅ Google tokens received');

      final credential = GoogleAuthProvider.credential(
        accessToken: null,
        idToken: googleAuth.id,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      final user = UserEntity(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
        displayName: userCredential.user!.displayName,
        photoUrl: userCredential.user!.photoURL,
      );

      currentUser.value = user;

      Get.offAllNamed('/home', predicate: (route) => false);
      Get.snackbar('Success', 'Welcome ${user.email}!');

    } catch (e) {
      print(' Google Sign-In Error: $e');
      Get.snackbar('Error', 'Google Sign-In failed. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await logoutUseCase.call();
      await _googleSignIn.signOut();
      currentUser.value = null;
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', 'Logout failed');
    }
  }
}