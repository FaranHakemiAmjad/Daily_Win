import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/user_account_model.dart';

abstract class AuthFirebaseDataSource {
  Future<UserAccountModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future<UserAccountModel> signUp({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  final FirebaseAuth firebaseAuth;

  AuthFirebaseDataSourceImpl({
    required this.firebaseAuth,
  });

  @override
  Future<UserAccountModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // credential.user is never null after a successful sign in
      return UserAccountModel.fromFirebase(credential.user!);

    } on FirebaseAuthException catch (e) {
      // Firebase gives us error codes — map them to our exceptions
      throw AuthException(message: e.code);
      // codes: 'invalid-email', 'wrong-password', 'user-not-found'
      // repository will map these codes to Failure classes
    }
  }

  @override
  Future<UserAccountModel> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserAccountModel.fromFirebase(credential.user!);

    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.code);
      // codes: 'email-already-in-use', 'invalid-email', 'weak-password'
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // await googleSignIn.signOut(); // clears Google session
      await firebaseAuth.signOut(); // clears Firebase session
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }
}