import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petapplication/pages/homepage/scrolled_reminder.dart';

class CheckedReminderProvider extends StateNotifier<List<Reminders>> {
  //To assign an initial value of no selection to a checked list.
  CheckedReminderProvider() : super([]);
  void toggleReminderCheckedStatus(Reminders reminder) {
    final reminderIsChecked = state.contains(reminder);
    if (reminderIsChecked) {
      state = state.where((r) => r.reminderId != reminder.reminderId).toList();
    } else {
      state = [...state, reminder];
    }
    state = [];
  }
}

final remindersDataList = StateNotifierProvider((ref) {
  return CheckedReminderProvider();
});
