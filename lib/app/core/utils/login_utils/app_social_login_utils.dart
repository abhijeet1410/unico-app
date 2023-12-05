import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:unico_app/flavors/build_config.dart';
import 'package:unico_app/flavors/env_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AppSocialLoginUtils {
  static Future<String?> getGoogleAccessToken(
      {String? googleClientId, List<String>? scopes}) async {
    final EnvConfig appConfig = BuildConfig.instance.config;
    GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: scopes ?? <String>['email'],
        clientId: googleClientId ?? appConfig.googleClientId);
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
    final FacebookAuth facebookLogin = FacebookAuth.instance;
    final LoginResult facebookLoginResult = await facebookLogin.login();
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
      final AuthorizationCredentialAppleID credential =
          await SignInWithApple.getAppleIDCredential(
        scopes: <AppleIDAuthorizationScopes>[
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
