import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void uploadingUserInformationTofireStore(
    {String? uploadedImage, required BuildContext context}) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return null;
  }

  try {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'profile_image': uploadedImage,
      'phone_number': user.phoneNumber,
      'email': user.email,
      'user_id': user.uid,
      'user_name': user.displayName,
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

void uploadingUserInformationTofireStoreWithManualUploading({
  String? uploadedImage,
  required BuildContext context,
  String? displayName,
  String? phoneNumber,
}) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return;
  }

  try {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'profile_image': uploadedImage,
      'phone_number': phoneNumber,
      'email': user.email,
      'user_id': user.uid,
      'user_name': displayName,
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
  }
}
