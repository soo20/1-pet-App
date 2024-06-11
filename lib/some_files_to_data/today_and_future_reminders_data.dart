import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/some_files_to_data/adding_pet_to_firestore.dart';
import 'package:petapplication/some_files_to_data/reminders_api.dart';

class Reminders {
  Reminders({
    required this.imageUrl,
    required this.eventTitle,
    required this.time,
    required this.petName,
    required this.checked,
    required this.reminderId,
  });
  late String imageUrl;
  late String eventTitle;
  late String time;
  late String petName;
  late String reminderId;
  late bool checked;
}

class FutureEventsInformations {
  FutureEventsInformations({
    required this.imageUrl,
    required this.eventTitle,
    required this.eventDate,
    required this.petName,
    required this.petType,
    required PetsInformation pet,
  }) : pet = pet;
  late String imageUrl;
  late String eventTitle;
  late String eventDate;
  late String petName;
  late String petType;
  late PetsInformation pet;
  PetsInformation get petInfo => pet;
}

Future<List<Reminders>> mergeReminders() async {
  User? user = FirebaseAuth.instance.currentUser;
  final List<Reminders> returnedList = [];
  if (user == null) {
    throw Exception('No user is signed in');
  }

  // Fetch reminders for the user
  final reminderApi = ReminderDataApi();
  QuerySnapshot remindersSnapshot = await FirebaseFirestore.instance
      .collection('reminders')
      .where('user-id', isEqualTo: user.uid)
      .get();

  // Fetch pets for the user
  List<PetsInformation> petsList = await fetchUserPets();

  if (remindersSnapshot.docs.isNotEmpty) {
    List<ReminderData> remindersList = remindersSnapshot.docs.map((doc) {
      return reminderApi.fromFirestore(doc) as ReminderData;
    }).toList();

    Map<String, String> petImages = {};

    QuerySnapshot petsSnapshot = await FirebaseFirestore.instance
        .collection('pets')
        .where('userId', isEqualTo: user.uid)
        .get();

    for (var doc in petsSnapshot.docs) {
      petImages[doc.id] = doc['imageUrl'];
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    for (ReminderData reminder in remindersList) {
      final reminderDate = DateTime(
        int.parse(reminder.year),
        reminder.monthNumber,
        int.parse(reminder.day),
      );

      if (reminderDate.day == today.day) {
        returnedList.add(
          Reminders(
            imageUrl: petImages[reminder.petId]!,
            eventTitle: reminder.reminderType,
            time: '${reminder.hours}:${reminder.minutes} ${reminder.night}',
            petName: petsList
                .firstWhere((pet) => pet.petId == reminder.petId)
                .petName,
            checked: reminder.checked,
            reminderId: reminder.reminderId,
          ),
        );
      }
    }
  }
  return returnedList;
}

Future<List<FutureEventsInformations>> getFutureEvents() async {
  User? user = FirebaseAuth.instance.currentUser;
  final List<FutureEventsInformations> returnedList = [];

  if (user == null) {
    throw Exception('No user is signed in');
  }

  final reminderApi = ReminderDataApi();
  QuerySnapshot remindersSnapshot = await FirebaseFirestore.instance
      .collection('reminders')
      .where('user-id', isEqualTo: user.uid)
      .get();

  List<ReminderData> remindersList = remindersSnapshot.docs.map((doc) {
    return reminderApi.fromFirestore(doc) as ReminderData;
  }).toList();

  List<PetsInformation> petsList = await fetchUserPets();

  print('Reminders fetched: ${remindersList.length}');
  print('Pets fetched: ${petsList.length}');

  Map<String, String> eventsPhoto = {
    'Cat_Gromming':
        'assets/image/home_page_afterAdding_pets_assets/cat_gromming.png',
    'Dog_Gromming':
        'assets/image/home_page_afterAdding_pets_assets/dog_gromming.png',
    'Medical Checkup':
        'assets/image/home_page_afterAdding_pets_assets/vet_appointment.png',
    'Cat_Playing':
        'assets/image/home_page_afterAdding_pets_assets/cat_playing.png',
    'Dog_Playing':
        'assets/image/home_page_afterAdding_pets_assets/dog_playing.png',
    'Bathing':
        'assets/image/home_page_afterAdding_pets_assets/pets_bathing.png',
    'Cat_Walking':
        'assets/image/home_page_afterAdding_pets_assets/cat_Walking.png',
    'Dog_Walking':
        'assets/image/home_page_afterAdding_pets_assets/dog_walking.png',
    'Custom':
        'assets/image/home_page_afterAdding_pets_assets/custom_events.png',
  };

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final nextThreeDays = today.add(const Duration(days: 4));

  for (ReminderData reminder in remindersList) {
    final reminderDate = DateTime(
      int.parse(reminder.year),
      reminder.monthNumber,
      int.parse(reminder.day),
    );

    if (reminderDate.isBefore(nextThreeDays) && reminderDate.isAfter(today)) {
      String reminderType = reminder.reminderType;

      String petType = petsList
          .firstWhere((pet) => pet.petId == reminder.petId)
          .petIsDogOrCat!;
      final String weekDay = DateFormat('E').format(reminderDate);
      print(petType);
      returnedList.add(FutureEventsInformations(
        imageUrl: (eventsPhoto[reminderType] ??
            eventsPhoto['${petType}_$reminderType'] ??
            eventsPhoto['Custom'])!,
        eventTitle: reminder.reminderType,
        eventDate:
            '$weekDay ${reminder.hours}:${reminder.minutes} ${reminder.night}',
        petName:
            petsList.firstWhere((pet) => pet.petId == reminder.petId).petName,
        petType: petsList
            .firstWhere((pet) => pet.petId == reminder.petId)
            .petIsDogOrCat!,
        pet: petsList.firstWhere((pet) => pet.petId == reminder.petId),
      ));
    }
  }

  print('Returned list length: ${returnedList.length}');
  return returnedList;
}
// Future<List<FutureEventsInformations>> getFutureEvents() async {
//   User? user = FirebaseAuth.instance.currentUser;
//   final List<FutureEventsInformations> returnedList = [];

//   if (user == null) {
//     throw Exception('No user is signed in');
//   }

//   final reminderApi = ReminderDataApi();
//   QuerySnapshot remindersSnapshot = await FirebaseFirestore.instance
//       .collection('reminders')
//       .where('user-id', isEqualTo: user.uid)
//       .get();

//   List<ReminderData> remindersList = remindersSnapshot.docs.map((doc) {
//     return reminderApi.fromFirestore(doc) as ReminderData;
//   }).toList();

//   List<PetsInformation> petsList = await fetchUserPets();

//   Map<String, String> eventsPhoto = {
//     'Cat_Gromming':
//         'assets/image/home_page_afterAdding_pets_assets/cat_gromming.png',
//     'Dog_Gromming':
//         'assets/image/home_page_afterAdding_pets_assets/dog_gromming.png',
//     'Medical Checkup':
//         'assets/image/home_page_afterAdding_pets_assets/vet_appointment.png',
//     'Cat_Playing':
//         'assets/image/home_page_afterAdding_pets_assets/cat_playing.png',
//     'Dog_playing':
//         'assets/image/home_page_afterAdding_pets_assets/dog_playing.png',
//     'Bathing':
//         'assets/image/home_page_afterAdding_pets_assets/pets_bathing.png',
//     'Cat_Walking':
//         'assets/image/home_page_afterAdding_pets_assets/cat_Walking.png',
//     'Dog_Walking':
//         'assets/image/home_page_afterAdding_pets_assets/dog_walking.png',
//     'Custom':
//         'assets/image/home_page_afterAdding_pets_assets/custom_events.png',
//   };

//   final now = DateTime.now();
//   final today = DateTime(now.year, now.month, now.day);
//   final nextThreeDays = today.add(const Duration(days: 4));

//   for (ReminderData reminder in remindersList) {
//     final reminderDate = DateTime(
//       int.parse(reminder.year),
//       reminder.monthNumber,
//       int.parse(reminder.day),
//     );

//     print('Reminder Date: $reminderDate');
//     print('Today: $today');
//     print('Next Three Days: $nextThreeDays');

//     if (reminderDate.isBefore(nextThreeDays) && reminderDate.isAfter(today)) {
//       String reminderType = reminder.reminderType;
//       PetsInformation petInfo =
//           petsList.firstWhere((pet) => pet.petId == reminder.petId);
//       String petType = petInfo.petType;

//       String? imageUrl =
//           reminderType == 'Bathing' || reminderType == 'Medical Checkup'
//               ? eventsPhoto[reminderType]
//               : eventsPhoto['${petType}_$reminderType'];

//       imageUrl ??= eventsPhoto['Custom']; // Provide default if imageUrl is null

//       print(
//           'Event Added: ${reminder.reminderType}, Pet Name: ${petInfo.petName}');

//       returnedList.add(FutureEventsInformations(
//         imageUrl: imageUrl!,
//         eventTitle: reminder.reminderType,
//         eventDate:
//             '${reminderDate.weekday} ${reminder.hours}:${reminder.minutes} ${reminder.night}',
//         petName: petInfo.petName,
//         petType: petInfo.petIsDogOrCat!,
//         pet: petInfo,
//       ));
//     }
//   }

//   print('Total Events: ${returnedList.length}');
//   return returnedList;
// }
