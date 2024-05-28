import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/some_files_to_data/adding_pet_to_firestore.dart';

class ReminderDataApi {
  Future<void> addReminderInFireStore({
    required selectedDate,
    required reminderTime,
    required reminderType,
    required petId,
  }) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }
// Upload pet image and get the download URL

      // Reference to the Firestore collection
      CollectionReference remindersCollection =
          FirebaseFirestore.instance.collection('reminders');

      // Add the pet document with a generated ID
      DocumentReference documentRef = await remindersCollection.add({
        'reminder-date': selectedDate,
        'reminder-title': reminderType,
        'reminder-time': reminderTime,
        'user-id': user.uid,
        'pet-id': petId,
        'reminder-id': '',
      });
      //to can edit on this reminder
      final reminderId = documentRef.id;
      await documentRef.update({'petId': reminderId});
    } catch (e) {
      rethrow;
    }
  }

  Future<ReminderData?> createReminderData(
      DateTime selectedDate,
      TimeOfDay reminderTime,
      String currentItemSelected,
      PetsInformation pet) async {
    // Extracting date components
    final String day = selectedDate.day.toString();
    final String month = DateFormat('MMM').format(selectedDate);
    final String year = selectedDate.year.toString();
    final String weekDay = DateFormat('E').format(selectedDate);
    ReminderData returnedReminder;
    // Extracting time components
    final String hours = reminderTime.hourOfPeriod.toString().padLeft(2, '0');
    final String period = reminderTime.hour < 12 ? 'AM' : 'PM';
    final String minutes = reminderTime.minute.toString().padLeft(2, '0');
    returnedReminder = ReminderData(
        day: day,
        month: month,
        reminderType: currentItemSelected,
        hours: hours,
        minutes: minutes,
        night: period,
        weekDay: weekDay,
        year: year,
        petId: pet.petId,
        reminderId: '');

    return returnedReminder;
  }

  ReminderData? fromFirestore(DocumentSnapshot doc) {
    try {
      Map data = doc.data() as Map<String, dynamic>;
      DateTime date = data['reminder-date'] as DateTime;
      TimeOfDay time = data['reminder-time'] as TimeOfDay;
      return ReminderData(
        day: date.day.toString(),
        month: DateFormat('MMM').format(date),
        reminderType: data['reminder-title'],
        hours: time.hourOfPeriod.toString().padLeft(2, '0'),
        minutes: time.minute as String,
        night: time.hour < 12 ? 'AM' : 'PM',
        weekDay: date.weekday as String,
        year: date.year.toString(),
        petId: data[' petId'],
        reminderId: data['reminderId'],
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<List<ReminderData?>> fetchRemindersDatafromFirestore({
    required DocumentReference docRef,
    petId,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('reminders')
          .where('userId', isEqualTo: user.uid)
          .where('pet-id', isEqualTo: petId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        List<ReminderData?> remindersList = querySnapshot.docs.map((doc) {
          return fromFirestore(doc);
        }).toList();
        return remindersList;
      } else {
        return [];
      }
    } on FirebaseException {
      rethrow;
    }
  }

  // Extracting date components
}
