import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_template_3/flavors/build_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

///
/// Created by Sunil Kumar
/// On 23-08-2022 01:44 PM
///
class AppSocialLoginHelper {
  static Future<String?> getGoogleAccessToken() async {
    final appConfig = BuildConfig.instance.config;
    GoogleSignIn googleSignIn =
        GoogleSignIn(scopes: ['email'], clientId: appConfig.googleClientId);
    try {
      GoogleSignInAccount? result = await googleSignIn.signIn();
      if (result == null) {
        return null;
      }
      GoogleSignInAuthentication googleAuth = await result.authentication;
      return googleAuth.accessToken;
    } catch (e) {
      rethrow;
    } finally {
      googleSignIn.signOut();
    }
  }

  static Future<String?> getFacebookAccessToken() async {
    final facebookLogin = FacebookAuth.instance;
    final facebookLoginResult = await facebookLogin.login();
    switch (facebookLoginResult.status) {
      case LoginStatus.failed:
        throw facebookLoginResult.message ?? "";
      case LoginStatus.cancelled:
        return null;
      case LoginStatus.success:
        final String token = facebookLoginResult.accessToken!.token;
        await facebookLogin.logOut();
        return token;
      default:
        return null;
    }
  }

  static Future<String?> getAppleAccessToken() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      if (credential.email == null || credential.email!.isEmpty) {
        throw 'Unable to fetch your email. Please try other login methods';
      }
      return credential.identityToken!;
    } catch (e) {
      if (e is SignInWithAppleAuthorizationException) {
        switch (e.code) {
          case AuthorizationErrorCode.canceled:
            return null;
          default:
            throw 'Unable to login with apple';
        }
      }
      throw e.toString();
    }
  }
}
