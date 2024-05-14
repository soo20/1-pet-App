// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';



Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}






Future<void> signInWithFacebook() async {
  try {
    // Trigger the Facebook sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Check if the login was successful
    if (loginResult.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Sign in with the credential
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      // Access the user's profile data
      final user = userCredential.user;
      final String? email = user?.email;
      final String? photoUrl = user?.photoURL;
      final String? name = user?.displayName;

      // Handle the user's profile data as needed
      // For example, print it to the console
      
      print('Name: $name, Email: $email, Photo URL: $photoUrl');

    } else {
      // Handle Facebook login failure
      print('Facebook login failed');
    }
  } catch (e) {
    print('Error signing in with Facebook: $e');
  }
}

// Define an async function to handle the Facebook login process
