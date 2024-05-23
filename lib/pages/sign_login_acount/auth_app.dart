// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class NewUserException implements Exception {
  final String message;
  NewUserException(this.message);

  @override
  String toString() => message;
}

final GoogleSignIn googleSignIn = GoogleSignIn();
Future<UserCredential?> signUpWithGoogle() async {
  // Check if the user is already signed in
  GoogleSignInAccount? googleUser = GoogleSignIn.standard().currentUser;

  // If not, trigger the authentication flow
  googleUser ??= await googleSignIn.signIn();

  // If the user cancelled the sign-in flow, return null
  if (googleUser == null) {
    return null;
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Try signing in with the selected account
  try {
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Existing user can proceed
    return userCredential;
  } catch (e) {
    print("Error signing in: $e");
    // Re-throw the exception to be caught in the onTap error handler
    rethrow;
  }
}

Future<UserCredential?> signInWithGoogle() async {
  // Check if the user is already signed in
  GoogleSignInAccount? googleUser = googleSignIn.currentUser;

  // If not, trigger the authentication flow
  googleUser ??= await googleSignIn.signIn();

  // If the user cancelled the sign-in flow, return null
  if (googleUser == null) {
    return null;
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Try signing in with the selected account
  try {
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Check if the user is new
    final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

    // If the user is new, delete their account and throw an exception
    if (isNewUser) {
      await userCredential.user?.delete();
      throw NewUserException(
          "You don't have an account yet. Please sign up first and try again.");
    }

    // Existing user can proceed
    return userCredential;
  } catch (e) {
    print("Error signing in: $e");
    // Re-throw the exception to be caught in the onTap error handler
    rethrow;
  }
}

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);
  try {
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    // Check if the user is new
    final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

    // If the user is new, delete their account and throw an exception
    if (isNewUser) {
      await userCredential.user?.delete();
      throw NewUserException(
          "You don't have an account yet. Please sign up first and try again.");
    }

    // Existing user can proceed
    return userCredential;
  } catch (e) {
    print("Error signing in: $e");
    // Re-throw the exception to be caught in the onTap error handler
    rethrow;
  }
  // Once signed in, return the UserCredential
}

Future<UserCredential?> signUpWithFacebook() async {
  try {
    // Trigger the Facebook sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    // Check if the login was successful
    if (loginResult.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Sign in with the credential
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      return userCredential;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
