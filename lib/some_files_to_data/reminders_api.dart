import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/some_files_to_data/adding_pet_to_firestore.dart';

class MergedReminderData {
  MergedReminderData({
    required this.date,
    required this.remindertime,
  });
  final TimeOfDay remindertime;
  final DateTime date;
  TimeOfDay getReminderTime() {
    return remindertime;
  }

  DateTime getrReminderDate() {
    return date;
  }
}

class ReminderDataApi {
  Future<void> addReminderInFireStore({
    required selectedDate,
    required TimeOfDay reminderTime,
    required reminderType,
    required petId,
  }) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }

      CollectionReference remindersCollection =
          FirebaseFirestore.instance.collection('reminders');

      DocumentReference documentRef = await remindersCollection.add({
        'reminder-date': selectedDate.toString(),
        'reminder-title': reminderType,
        'reminder-hour': reminderTime.hour,
        'reminder-minute': reminderTime.minute,
        'user-id': user.uid,
        'pet-id': petId,
        'reminder-id': '',
      });

      final reminderId = documentRef.id;
      await documentRef.update({'reminder-id': reminderId});
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

      DateTime date = DateTime.parse(data['reminder-date']);
      int hour = data['reminder-hour'];
      int minute = data['reminder-minute'];
      TimeOfDay time = TimeOfDay(hour: hour, minute: minute);

      return ReminderData(
        day: date.day.toString(),
        month: DateFormat('MMM').format(date),
        reminderType: data['reminder-title'],
        hours: time.hourOfPeriod.toString().padLeft(2, '0'),
        minutes: minute.toString().padLeft(2, '0'),
        night: time.hour < 12 ? 'AM' : 'PM',
        weekDay: DateFormat('EEE').format(date),
        year: date.year.toString(),
        petId: data['pet-id'],
        reminderId: data['reminder-id'],
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateReminder({
    required reminderId,
    required selectedDate,
    required TimeOfDay reminderTime,
    required reminderType,
    required petId,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }
      await FirebaseFirestore.instance
          .collection('reminders')
          .where('user-id', isEqualTo: user.uid)
          .where('pet-id', isEqualTo: petId)
          .where('pet-id', isEqualTo: reminderId)
          .get()
          .then((_) {
        FirebaseFirestore.instance
            .collection('reminders')
            .doc(reminderId)
            .update({
          'reminder-date': selectedDate.toString(),
          'reminder-title': reminderType,
          'reminder-hour': reminderTime.hour,
          'reminder-minute': reminderTime.minute,
        });
      }).catchError((error) {
        throw error;
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<List<ReminderData?>> fetchRemindersDatafromFirestore({
    required String petId,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('reminders')
          .where('user-id', isEqualTo: user.uid)
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

  Future<void> deleteReminder(
      {required String reminderId, required String petId}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No user is signed in');
      }

      // Fetch the documents that match the criteria
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('reminders')
          .where('user-id', isEqualTo: user.uid)
          .where('pet-id', isEqualTo: petId)
          .where('reminder-id', isEqualTo: reminderId)
          .get();

      // Ensure there is exactly one document to delete
      if (querySnapshot.docs.isNotEmpty) {
        // Get the document ID
        String docId = querySnapshot.docs.first.id;

        // Delete the document
        await FirebaseFirestore.instance
            .collection('reminders')
            .doc(docId)
            .delete();

        print("Deleted reminder successfully");
      } else {
        print("No matching document found");
      }
    } catch (error) {
      print("Error deleting reminder: $error");
      rethrow;
    }
  }

  MergedReminderData mergedReminderData(ReminderData reminder) {
    DateTime date = DateTime(int.parse(reminder.year),
        int.parse(reminder.month), int.parse(reminder.day));
    int hour = int.parse(reminder.hours);
    int minute = int.parse(reminder.hours);
    TimeOfDay time = TimeOfDay(hour: hour, minute: minute);
    return MergedReminderData(date: date, remindertime: time);
  }
}
