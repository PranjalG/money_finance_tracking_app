import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }

  // Email & Password Sign In
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }

  // Google Sign In
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      return result.user;
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }

  // Apple Sign In
  // Future<User?> signInWithApple() async {
  //   try {
  //     final credential = await SignInWithApple.get  (
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );

      // final appleProvider = AppleAuthProvider.credential(
      //
      //   // accessToken: String.fromCharCodes(credential.identityToken!),
      //   // idToken: String.fromCharCodes(credential.authorizationCode!),
      // );

    //   UserCredential result = await _auth.signInWithCredential(appleProvider);
    //   return result.user;
    // } on SignInWithAppleAuthorizationException catch (e) {
    //   if (e.code == AuthorizationErrorCode.canceled) {
        // print('User canceled Apple Sign In');
  //     } else {
  //       // print(e.toString());
  //     }
  //     return null;
  //   } catch (e) {
  //     // print(e.toString());
  //     return null;
  //   }
  // }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut(); // Also sign out from Google if signed in
  }
}