import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

mixin AppleLoginMixin {
  /// Sign in with Apple
  Future<User?> signInWithApple(FirebaseAuth auth) async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final AuthorizationCredentialAppleID appleCredential =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );
    // context.showInfo('credentials: ${appleCredential.authorizationCode}\n idToken: ${appleCredential.identityToken}');
    // Create an `OAuthCredential` from the credential returned by Apple.
    final OAuthCredential oauthCredential =
        OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    // context.showInfo('OAuthCredential: $oauthCredential');

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    try {
      final User user =
          (await auth.signInWithCredential(oauthCredential)).user!;
      // final User currentUser = await super.auth.currentUser!;
      // assert(user.uid == currentUser.uid);
      // // assert(user.email != null);
      // // assert(user?.displayName != null);
      // // assert(user?.photoURL != null);
      // name = user.displayName;
      // email = user.email;
      // imageUrl = user.photoURL;
      return user;
    } catch (e) {
      // context.showError('Error: $e');
      return null;
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
