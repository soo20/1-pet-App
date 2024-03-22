import 'package:petapplication/pages/homepage/scrolled_reminder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remindersProvider = Provider((ref) {
  return Reminders.reminderInformationList;
});
