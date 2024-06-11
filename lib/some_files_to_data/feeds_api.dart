import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomTime {
  CustomTime({
    required this.hours,
    required this.minutes,
    required this.night,
    required this.checked,
    required this.feedId,
    required this.petId,
    required this.timeOfCreation,
  });
  late String hours;
  late String minutes;
  late String night;
  late String feedId;
  late String petId;
  late Timestamp timeOfCreation;
  bool checked = false;
}

class FeedTimesApi {
  Future<String?> addFeedInFireStore({
    required TimeOfDay timeOfDay,
    required String petId,
  }) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }

      // Reference to the Firestore collection
      CollectionReference feedTimesCollection =
          FirebaseFirestore.instance.collection('feedTimes');
      // Get the current time
      Timestamp currentTime = Timestamp.now();

      // Add the pet document with a generated ID
      DocumentReference documentRef = await feedTimesCollection.add({
        'feed-hour': timeOfDay.hour,
        'feed-minute': timeOfDay.minute,
        'pet-id': petId,
        'user-id': user.uid,
        'checked': "false",
        'feedId': '',
        'timeOfCreation': currentTime,
      });

      // Update the document with the generated ID
      final feedId = documentRef.id;
      await documentRef.update({'feedId': feedId});

      return feedId;
    } catch (e) {
      print('Error adding feed to Firestore: $e');
      rethrow;
    }
  }

  CustomTime? fromFirestore(DocumentSnapshot doc) {
    try {
      Map data = doc.data() as Map<String, dynamic>;

      int hour = data['feed-hour'];
      int minute = data['feed-minute'];
      TimeOfDay time = TimeOfDay(hour: hour, minute: minute);

      return CustomTime(
        hours: time.hourOfPeriod.toString().padLeft(2, '0'),
        minutes: minute.toString().padLeft(2, '0'),
        night: time.hour < 12 ? 'AM' : 'PM',
        petId: data['pet-id'],
        checked: data['checked'] == "false" ? false : true,
        feedId: data['feedId'],
        timeOfCreation: data['timeOfCreation'],
      );
    } catch (error) {
      rethrow;
    }
  }

  CustomTime createFeedTime(
      {required TimeOfDay reminderTime,
      required BuildContext context,
      required String petId}) {
    // Extracting date components

    // Extracting time components
    final String hours = reminderTime.hourOfPeriod.toString().padLeft(2, '0');
    final String period = reminderTime.hour < 12 ? 'AM' : 'PM';
    final String minutes = reminderTime.minute.toString().padLeft(2, '0');

    return CustomTime(
      hours: hours,
      minutes: minutes,
      night: period,
      checked: false,
      feedId: '',
      petId: petId,
      timeOfCreation: Timestamp.now(),
    );
  }

  Future<List<CustomTime>> getFeedTimes({
    required String petId,
  }) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }

      Timestamp currentTime = Timestamp.now();

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('feedTimes')
          .where('user-id', isEqualTo: user.uid)
          .where('pet-id', isEqualTo: petId)
          .get();

      List<CustomTime> feeds = querySnapshot.docs
          .map((doc) => fromFirestore(doc))
          .whereType<CustomTime>()
          .toList();

      List<String> feedsToDelete = [];
      List<CustomTime> validFeeds = [];

      DateTime currentDateTime = currentTime.toDate();

      for (CustomTime time in feeds) {
        DateTime creationTime = time.timeOfCreation.toDate();
        if (currentDateTime.difference(creationTime).inHours >= 24) {
          feedsToDelete.add(time.feedId);
        } else {
          validFeeds.add(time);
        }
      }

      // Delete outdated feed times from Firestore
      for (String feedId in feedsToDelete) {
        await FirebaseFirestore.instance
            .collection('feedTimes')
            .doc(feedId)
            .delete();
      }

      return validFeeds;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteFeedTimes({
    required List<String> selectedItems,
    required String petId,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }

      // Make a copy of the list to iterate over
      List<String> itemsToDelete = List.from(selectedItems);

      for (String feedId in itemsToDelete) {
        await FirebaseFirestore.instance
            .collection('feedTimes')
            .doc(feedId)
            .delete();
      }

      print("Deleted feeds successfully");
    } catch (error) {
      print("Error on delete feeds: $error");
      rethrow;
    }
  }

  Future<void> feedCheckedState({
    required String value,
    required String feedId,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }

      // Make a copy of the list to iterate over

      await FirebaseFirestore.instance
          .collection('feedTimes')
          .doc(feedId)
          .update({'checked': value});

      print("update ckecked feed successfully");
    } catch (error) {
      print("Error on update feeds: $error");
      rethrow;
    }
  }
}
