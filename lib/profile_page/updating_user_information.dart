import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> updateUserInformation({
  required BuildContext cxt,
  String? imageUrl,
  required String phoneNumber,
  required String name,
  required String email,
}) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return;
  }

  try {
    await user.updateDisplayName(name);
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      'profile_image': imageUrl,
      'phone_number': phoneNumber,
      'email': user.email,
      'user_name': user.displayName,
    });
  } on FirebaseException catch (error) {
    print(error);
    ScaffoldMessenger.of(cxt).clearSnackBars();
    ScaffoldMessenger.of(cxt).showSnackBar(
      SnackBar(
        content: Text(
          error.toString(),
        ),
        action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              ScaffoldMessenger.of(cxt).hideCurrentSnackBar();
            }),
      ),
    );
  }
}
