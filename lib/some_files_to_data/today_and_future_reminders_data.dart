import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/pages/my_pets_pages/my_pets.dart';

class Reminders {
  Reminders({
    required this.imageUrl,
    required this.eventTitle,
    required this.time,
    required this.petName,
    required this.checked,
  });
  late String imageUrl;
  late String eventTitle;
  late String time;
  late String petName;
  late int reminderId;
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

List<Reminders> mergeReminders(
    List<PetsInformation> dogsList, List<PetsInformation> catsList) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  //final nextThreeDays = today.add(const Duration(days: 3));
  final List<Reminders> returnedList = [];
  // Clear the lists before merging reminders
  Map<String, int> monthsMap = {
    'Jan': 1,
    'Feb': 2,
    'Mar': 3,
    'Apr': 4,
    'May': 5,
    'Jun': 6,
    'Jul': 7,
    'Aug': 8,
    'Sep': 9,
    'Oct': 10,
    'Nov': 11,
    'Dec': 12,
  };
  // Iterate through each pet
  for (PetsInformation pet in dogsList) {
    for (ReminderData reminder in pet.remindersData) {
      final reminderDate = DateTime(
        int.parse(reminder.year),
        monthsMap[reminder.month]!,
        int.parse(reminder.day),
      );
      if (reminderDate.day == today.day) {
        returnedList.add(
          Reminders(
            imageUrl: pet.imageUrl,
            eventTitle: reminder.reminderType,
            time: '${reminder.hours}:${reminder.minutes} ${reminder.night}',
            petName: pet.petName,
            checked: false,
          ),
        );
      }
    }
  }

  // Merge reminders for cats
  for (PetsInformation pet in catsList) {
    for (ReminderData reminder in pet.remindersData) {
      final reminderDate = DateTime(
        int.parse(reminder.year),
        monthsMap[reminder.month]!,
        int.parse(reminder.day),
      );
      if (reminderDate.day == today.day) {
        returnedList.add(
          Reminders(
            imageUrl: pet.imageUrl,
            eventTitle: reminder.reminderType,
            time: '${reminder.hours}:${reminder.minutes} ${reminder.night}',
            petName: pet.petName,
            checked: false,
          ),
        );
      }
    }
  }
  return returnedList;
}

List<FutureEventsInformations> getFutureEvents(
    List<PetsInformation> dogsList, List<PetsInformation> catsList) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final nextThreeDays = today.add(const Duration(days: 4));

  final List<FutureEventsInformations> returnedList = [];
  // Clear the lists before merging reminders
  Map<String, int> monthsMap = {
    'Jan': 1,
    'Feb': 2,
    'Mar': 3,
    'Apr': 4,
    'May': 5,
    'Jun': 6,
    'Jul': 7,
    'Aug': 8,
    'Sep': 9,
    'Oct': 10,
    'Nov': 11,
    'Dec': 12,
  };
  // Iterate through each pet
  for (PetsInformation pet in dogsList) {
    for (ReminderData reminder in pet.remindersData) {
      final reminderDate = DateTime(
        int.parse(reminder.year),
        monthsMap[reminder.month]!,
        int.parse(reminder.day),
      );

      if (reminderDate.isBefore(nextThreeDays) && reminderDate.isAfter(today)) {
        returnedList.add(FutureEventsInformations(
          imageUrl: pet.imageUrl,
          eventTitle: reminder.reminderType,
          eventDate:
              '${reminder.weekDay} ${reminder.hours}:${reminder.minutes} ${reminder.night}',
          petName: pet.petName,
          petType: pet.petType,
          pet: pet,
        ));
      }
    }
  }

  // Merge reminders for cats
  for (PetsInformation pet in catsList) {
    for (ReminderData reminder in pet.remindersData) {
      final reminderDate = DateTime(
        int.parse(reminder.year),
        monthsMap[reminder.month]!,
        int.parse(reminder.day),
      );
      if (reminderDate.isBefore(nextThreeDays) && reminderDate.isAfter(today)) {
        returnedList.add(FutureEventsInformations(
          imageUrl: pet.imageUrl,
          eventTitle: reminder.reminderType,
          eventDate:
              '${reminder.weekDay} ${reminder.hours}:${reminder.minutes} ${reminder.night}',
          petName: pet.petName,
          petType: pet.petIsDogOrCat!,
          pet: pet,
        ));
      }
    }
  }
  return returnedList;
}
