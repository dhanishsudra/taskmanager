import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_manager/domain/models/user_entity.dart';
import 'package:task_manager/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
    final FirebaseAuth auth;
    AuthRepositoryImpl(this.auth);

      @override
      Future<UserEntity> signInWithEmail(String email, String password)async{
        try{
          final UserCredential credential = await auth.signInWithEmailAndPassword(
              email: email,
              password: password,
          );
          final firebaseUser = credential.user!;
            return UserEntity(
                uid: firebaseUser.uid,
                email: firebaseUser.email!,
                displayName: firebaseUser.displayName,
                photoUrl: firebaseUser.photoURL,
            );
        }catch(e){
          rethrow;
        }
      }

  @override
  Stream<UserEntity> get authStateChanges {
        return auth.authStateChanges().map((firebaseUser){
          return UserEntity(
              uid: firebaseUser!.uid,
              email: firebaseUser.email.toString(),
              displayName: firebaseUser.displayName,
            photoUrl: firebaseUser.photoURL,
          );
        });
  }


  @override
  Future<void> logout()async {
    await auth.signOut();
  }
}