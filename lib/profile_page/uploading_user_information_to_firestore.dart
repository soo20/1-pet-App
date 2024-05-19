import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void uploadingUserInformationTofireStore(
    String? uploadedImage, BuildContext context) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null || uploadedImage == null) {
    return null;
  }

  try {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'profile_image': uploadedImage,
      'phone_number': user.phoneNumber,
      'email': user.email,
      'user_id': user.uid,
    });
  } on FirebaseException {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
            'Failed to update your profile photo, please try again later....'),
        action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
      ),
    );
    return null;
  }
}
