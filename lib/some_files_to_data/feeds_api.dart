import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FeedTimesApi {
  Future<void> addFeedInFireStore({
    required TimeOfDay timeOfDay,
    required petId,
  }) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }

      // Reference to the Firestore collection
      CollectionReference remindersCollection =
          FirebaseFirestore.instance.collection('feedTimes');
      // Get the current time
      Timestamp currentTime = Timestamp.now();

      // Add the pet document with a generated ID
      DocumentReference documentRef = await remindersCollection.add({
        'feed-time': timeOfDay,
        'pet-id': petId,
        'user-id': user.uid,
        'feed-id': '',
        'timestamp': currentTime,
      });
      //to can edit on this reminder
      final feedId = documentRef.id;
      await documentRef.update({'feed-id': feedId});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getFeedId({
    required TimeOfDay timeOfDay,
    required petId,
  }) async {}
  Future<void> deleteFeedTimes({
    required TimeOfDay timeOfDay,
    required petId,
  }) async {}
}
