import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String?> uploadingImageOnFirebase(
    File? uploadedImage, BuildContext context) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null || uploadedImage == null) {
    return null;
  }

  try {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('users')
        .child(user.uid)
        .child('profile_photos')
        .child('${user.uid}.png');

    try {
      // Delete the previous image if it exists
      await storageRef.delete();
    } catch (e) {
      // If the image doesn't exist, continue without throwing an error
    }

    // Upload the new image
    await storageRef.putFile(uploadedImage);
    final imageUrl = await storageRef.getDownloadURL();

    await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
      {
        'profile_image': imageUrl,
      },
    );

    return imageUrl;
  } on FirebaseException {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
            'Failed to update your profile photo, please tryagain later....'),
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

Future<Image?> getProfileImage(BuildContext context, String? imageUrl) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null || imageUrl == null) {
    return null;
  }

  try {
    final http.Response response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final Uint8List imageData = response.bodyBytes;
      return Image.memory(imageData);
    } else {
      throw Exception('Failed to load image');
    }
  } on FirebaseException {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
            'Failed to load your profile photo, please try again later.'),
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
