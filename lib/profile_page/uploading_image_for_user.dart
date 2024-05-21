import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirebaseApiForUserImage {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  Future<String?> uploadingImageOnFirebase(
      File? uploadedImage, BuildContext context) async {
    if (user == null || uploadedImage == null) {
      return null;
    }

    try {
      final storageRef = _storage
          .ref()
          .child('users')
          .child(user!.uid)
          .child('profile_photos')
          .child('${user!.uid}.png');

      try {
        // Delete the previous image if it exists
        await storageRef.delete();
      } catch (e) {
        // If the image doesn't exist, continue without throwing an error
      }

      // Upload the new image
      await storageRef.putFile(uploadedImage);
      final imageUrl = await storageRef.getDownloadURL();

      await _firestore.collection('users').doc(user!.uid).update(
        {
          'profile_image': imageUrl,
        },
      );

      return imageUrl;
    } on FirebaseException catch (e) {
      print(user!.uid);
      // Failed to update your profile photo, please tryagain later....
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
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

  Future<String?> getProfileImage(BuildContext context) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return null;
      }
      final doc = await _firestore.collection('users').doc(user.uid).get();

      return doc.data()?['profile_image'];
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
}
