import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_structure/service/network/socialLogin/login_mixin/apple_login_mixin.dart';
import 'package:project_structure/service/network/socialLogin/login_mixin/facebook_login_mixin.dart';
import 'package:project_structure/service/network/socialLogin/login_mixin/google_login_mixin.dart';
import 'package:project_structure/service/network/socialLogin/login_mixin/twitter_login_mixin.dart';

enum LoginPlatform { apple, google, twitter, facebook }

class SocialLoginService
    with
        TwitterLoginMixin,
        AppleLoginMixin,
        FacebookLoginMixin,
        GoogleLoginMixin {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookAuth fbLogin = FacebookAuth.instance;
  User? user;

  //data not set in below variable through any methods check it
  String? name;
  String? email;
  String? imageUrl;

  loginWith({required LoginPlatform platform}) async {
    user = await choosLoginPlatform(platform: platform);
    //create condition as required
    if (user != null)
      return true;
    else
      return false;
  }

  Future<User?> choosLoginPlatform({required LoginPlatform platform}) async {
    switch (platform) {
      case LoginPlatform.apple:
        return signInWithApple(auth);
      case LoginPlatform.facebook:
        return signInWithFacebook(fbLogin, auth);
      case LoginPlatform.google:
        return signInWithGoogle(googleSignIn, auth);
      case LoginPlatform.twitter:
        return signInWithTwitter(auth);
      default:
        if (Platform.isIOS) return signInWithApple(auth);
        if (Platform.isAndroid) return signInWithGoogle(googleSignIn, auth);
    }
  }
}
