import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/pages/sign_login_acount/loginbody.dart';
import 'package:petapplication/some_files_to_data/adding_pet_to_firestore.dart';

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

  // Extracting time components
  final String hours = reminderTime.hourOfPeriod.toString().padLeft(2, '0');
  final String period = reminderTime.hour < 12 ? 'AM' : 'PM';
  final String minutes = reminderTime.minute.toString().padLeft(2, '0');
  final fireStore = FirebaseFirestore.instance;
  ReminderData returnedReminder;
  DocumentReference docRef =
      await FirebaseFirestore.instance.collection('reminders').add(
    {
      'day': day,
      'month': month,
      'year': year,
      'weekDay': weekDay,
      'hours': hours,
      'minutes': minutes,
      'reminderType': currentItemSelected,
      'night': period,
      'user-id': userId == 'null' ? 'not-signed' : userId,
      'pet-id': pet.petId,
    },
  );
  String reminderId = docRef.id;
  await FirebaseFirestore.instance
      .collection('reminders')
      .doc(reminderId)
      .update(
    {'reminder-id': reminderId},
  );

  DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
      await fireStore.collection('reminders').doc(reminderId).get();
  if (documentSnapshot.exists) {
    // Convert document snapshot to ReminderData
    returnedReminder = ReminderData(
      day: documentSnapshot['day'] ?? '',
      month: documentSnapshot['month'] ?? '',
      reminderType: documentSnapshot['reminderType'] ?? '',
      hours: documentSnapshot['hours'] ?? '',
      minutes: documentSnapshot['minutes'] ?? '',
      night: documentSnapshot['night'] ?? '',
      weekDay: documentSnapshot['weekDay'] ?? '',
      year: documentSnapshot['year'] ?? '',
      reminderId: documentSnapshot.id,
    );

    return returnedReminder;
  } else {
    return null;
  }
}
