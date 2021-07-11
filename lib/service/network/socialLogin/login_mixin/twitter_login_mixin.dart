import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

mixin TwitterLoginMixin {
  Future<User?> signInWithTwitter(FirebaseAuth auth) async {
    final TwitterLogin twitterLogin = TwitterLogin(
      /// Consumer API keys
      apiKey: 'FmdBQqxzUt655Sknrn34y6RAW',

      /// Consumer API Secret keys
      apiSecretKey: '8ON43eOqxw6xRbLrs6Faz6ipoH2KubwYSCyYArSqt8PzeozCPm',

      /// Registered Callback URLs in TwitterApp
      /// Android is a deeplink
      /// iOS is a URLScheme
      redirectURI: 'tashbyt://',
    );
    User? user;
    final AuthResult authResult = await twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        // success
        print('====== Login success ======');
        print(authResult.authToken);
        print(authResult.authTokenSecret);
        // Create a credential from the access token
        final OAuthCredential twitterAuthCredential =
            TwitterAuthProvider.credential(
          accessToken: authResult.authToken.toString(),
          secret: authResult.authTokenSecret.toString(),
        );
        try {
          // Once signed in, return the UserCredential
          user = (await auth.signInWithCredential(twitterAuthCredential)).user;
          // name = user?.displayName;
          // email = user?.email;
          // imageUrl = user?.photoURL;
        } catch (err) {
          print(err);
        }
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        print('====== Login cancel ======');
        break;
      case TwitterLoginStatus.error:
      case null:
        // error
        print('====== Login error ======');
        break;
    }

    return user;
  }
}
/// Sign in with Twitter

