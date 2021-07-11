import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

mixin FacebookLoginMixin {
// Sign in with Facebook
  Future<User?> signInWithFacebook(
      FacebookAuth fbLogin, FirebaseAuth auth) async {
    User? user;
    OAuthCredential facebookAuthCredential;
    try {
      final LoginResult result = await fbLogin.login();
      facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
    } catch (e) {
      // if (e ) {
      // print(e?.message);
      // }
      return null;
    }

    // Create a credential from the access token

    try {
      user = (await auth.signInWithCredential(facebookAuthCredential)).user;
      final User currentUser = auth.currentUser!;
      assert(user!.uid == currentUser.uid);
      print(currentUser.email);
      print(currentUser.displayName);
      // name = user!.displayName;
      // email = user.email;
      // imageUrl = user.photoURL;
    } catch (error) {
      auth.currentUser!.linkWithCredential(facebookAuthCredential);
      user = auth.currentUser;
      print('Linked user : $user');
    }
    return user;
  }
}
