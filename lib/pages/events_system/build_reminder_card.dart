import 'package:flutter/material.dart';

import 'package:petapplication/pages/events_system/events_for_pet.dart';

CustomTime createFeedTime(
    {required TimeOfDay reminderTime, required BuildContext context}) {
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
    feedId: UniqueKey().toString(),
  );
}
