import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

Future<void> deleteUserInformation(String id) async {
  try {
    // Fetch all the snapshots for user-related data
    QuerySnapshot reminderSnapshot = await FirebaseFirestore.instance
        .collection('reminders')
        .where('user-id', isEqualTo: id)
        .get();
    QuerySnapshot petsSnapshot = await FirebaseFirestore.instance
        .collection('pets')
        .where('userId', isEqualTo: id)
        .get();
    QuerySnapshot feedSnapshot = await FirebaseFirestore.instance
        .collection('feedTimes')
        .where('user-id', isEqualTo: id)
        .get();

    // Delete each document in the snapshots
    for (QueryDocumentSnapshot doc in petsSnapshot.docs) {
      await FirebaseFirestore.instance.collection('pets').doc(doc.id).delete();
    }

    for (QueryDocumentSnapshot doc in reminderSnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('reminders')
          .doc(doc.id)
          .delete();
    }

    for (QueryDocumentSnapshot doc in feedSnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('feedTimes')
          .doc(doc.id)
          .delete();
    }

    // Check if user document exists before deleting
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    if (userDoc.exists) {
      await FirebaseFirestore.instance.collection('users').doc(id).delete();
    }

    // Attempt to delete user storage folder if it exists
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('users').child(id);
      ListResult result = await storageRef.listAll();
      for (var item in result.items) {
        await item.delete();
      }
      for (var prefix in result.prefixes) {
        await prefix.delete();
      }
    } on FirebaseException catch (error) {
      if (error.code != 'object-not-found') {
        print("Error deleting storage: $error");
      }
    }

    print("All reminders deleted successfully for user: $id");
  } on FirebaseException catch (error) {
    print("Error deleting user information: $error");
  }
}
