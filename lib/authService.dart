import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    try {
      // Trigger Authentication Flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print(googleUser);

      if (googleUser != null) {
        // Obtaining auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        print(googleAuth);

        //Creating new credential
        final OAuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        print(credential);

        User? user = (await _auth.signInWithCredential(credential)).user;
        print(user);
      }
    } catch (e) {
      print(e);
    }
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    print('User sign out');
  }
}
