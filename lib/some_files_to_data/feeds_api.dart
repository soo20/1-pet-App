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
      DocumentReference documentRef = await remindersCollection.add(
        {
          'feed-hour': timeOfDay.hour,
          'feed-minute': timeOfDay.minute,
          'pet-id': petId,
          'user-id': user.uid,
          'checked': "false",
          'feedId': '',
          'timeOfCreation': currentTime,
        },
      );
      //to can edit on this reminder
      final feedId = documentRef.id;
      await documentRef.update({'feedId': feedId});
      return feedId;
    } catch (e) {
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
        checked: data['checked'],
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

      // Get the current time
      Timestamp currentTime = Timestamp.now();

      // Query the 'feedTimes' collection for the current user's pet
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('feedTimes')
          .where('user-id', isEqualTo: user.uid)
          .where('pet-id', isEqualTo: petId)
          .get();

      List<CustomTime> feeds = querySnapshot.docs.isNotEmpty
          ? querySnapshot.docs.map((doc) => fromFirestore(doc)).toList()
              as List<CustomTime>
          : [];

      // List to hold feeds created within the last 24 hours
      List<CustomTime> recentFeeds = [];

      for (CustomTime time in feeds) {
        Timestamp timeOfCreation = time.timeOfCreation;
        DateTime creationDateTime = timeOfCreation.toDate();
        DateTime currentDateTime = currentTime.toDate();

        // Calculate the difference between the current time and the creation time
        Duration difference = currentDateTime.difference(creationDateTime);

        if (difference.inHours < 24) {
          // If the feed was created within the last 24 hours, add it to the recentFeeds list
          recentFeeds.add(time);
        } else {
          // Otherwise, delete the document from the collection
          await FirebaseFirestore.instance
              .collection('feedTimes')
              .doc(time.feedId) // Assuming `time.id` holds the document ID
              .delete();
        }
      }

      // Return the list of recent feeds
      return recentFeeds;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteFeedTimes(
      {required List<String> selectedItems, required petId}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }
      for (String feedId in selectedItems) {
        await FirebaseFirestore.instance
            .collection('reminders')
            .doc(feedId)
            .delete();
      }
      print("Deleted feeds successfully");
    } catch (error) {
      print("Error on delete feeds: $error");
      rethrow;
    }
  }
}
