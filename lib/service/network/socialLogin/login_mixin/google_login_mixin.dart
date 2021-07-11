import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

mixin GoogleLoginMixin {
  // Sign in with google
  Future<User?> signInWithGoogle(
      GoogleSignIn googleSignIn, FirebaseAuth auth) async {
    User user;
    AuthCredential credential;
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount?.authentication;

      // Create a new credential
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    } catch (e) {
      return null;
    }

    user = (await auth.signInWithCredential(credential)).user!;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = await auth.currentUser!;
    assert(user.uid == currentUser.uid);
    // assert(user.email != null);
    // assert(user.displayName != null);
    // assert(user.photoURL != null);
    // name = user.displayName;
    // email = user.email;
    // imageUrl = user.photoURL;
    return user;
  }
}
