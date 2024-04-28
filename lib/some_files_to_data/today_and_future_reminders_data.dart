import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/pages/my_pets_pages/my_pets.dart';

class Reminders {
  Reminders({
    required this.imageUrl,
    required this.eventTitle,
    required this.time,
    required this.petName,
    this.checked = false,
  });
  late String imageUrl;
  late String eventTitle;
  late String time;
  late String petName;
  late int reminderId;
  bool checked;
}

// List<Reminders> futureEvents = [];
// List<Reminders> todayReminders = [];

void mergeReminders(
    {required List<PetsInformation> petsList,
    required List<Reminders> futureEvents,
    required List<Reminders> todayReminders}) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final nextThreeDays = today.add(const Duration(days: 3));

  // Clear the lists before merging reminders
  todayReminders.clear();
  futureEvents.clear();

  // Iterate through each pet
  for (PetsInformation pet in petsList) {
    // Iterate through each reminder of the pet
    for (ReminderData reminder in pet.remindersData) {
      // Parse reminder date
      final reminderDate = DateTime(
        int.parse(reminder.year),
        int.parse(reminder.month),
        int.parse(reminder.day),
      );

      // Check if the reminder is for today or within the next 3 days
      if (reminderDate.isAtSameMomentAs(today)) {
        todayReminders.add(
          Reminders(
            imageUrl: pet.imageUrl,
            eventTitle: reminder.reminderType,
            time: '${reminder.hours}:${reminder.minutes} ${reminder.night}',
            petName: pet.petName,
          ),
        );
      } else if (reminderDate.isBefore(nextThreeDays)) {
        futureEvents.add(
          Reminders(
            imageUrl: pet.imageUrl,
            eventTitle: reminder.reminderType,
            time: '${reminder.hours}:${reminder.minutes} ${reminder.night}',
            petName: pet.petName,
          ),
        );
      }
    }
  }
}
