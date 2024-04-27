// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:petapplication/pages/events_system/events_for_pet.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  DateTime dateTime = DateTime.now();
  TimeOfDay reminderTime = TimeOfDay.now();
  late String currentItemSelected;
  bool customType = false;
  bool calenderShowing = false;
  DateTime selectedDate = DateTime.now();
  DateTime previousDate = DateTime.now();
  late TextEditingController customTypeController;
  List<String> eventTypes = [
    'Gromming',
    'Playing',
    'Medical Checkup',
    'Bathing',
    'Walking',
    'Custom',
  ];
  @override
  void initState() {
    super.initState();
    currentItemSelected = 'Playing';
    customTypeController = TextEditingController();
  }

  @override
  void dispose() {
    customTypeController.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    void onFinishButtonPressed() {
      // Create the ReminderData object
      final ReminderData reminderData =
          createReminderData(selectedDate, reminderTime, currentItemSelected);
      setState(() {
        remindersForPet.add(reminderData);
      });
      // Add the ReminderData object to the list

      // Close the dialog
      Navigator.of(context).pop();
    }

    return AlertDialog(
      scrollable: true,
      backgroundColor: const Color(0xffEFE7E7),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          size.width * 0.058,
        ), // Set the border radius of the button
      ),
      title: const Text(
        'Add a new event',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
        height: 0.0,
        fontFamily: 'Cosffira',
        fontSize: size.width * 0.077,
        fontWeight: FontWeight.w800,
        color: const Color(0xff4A5E7C),
      ),
      content: Container(
        color: const Color(0xffEFE7E7),
        height: customType ? size.height * 0.6 : size.height * 0.43,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Event type',
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.048,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xffBEC2CC),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.80,
                padding: EdgeInsets.all(size.width * 0.02),
                margin: EdgeInsets.only(
                  top: size.height * 0.017,
                  bottom: size.height * 0.03,
                  left: size.width * 0.006,
                  right: size.width * 0.006,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    size.width * 0.045,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, size.width * 0.002),
                      color: const Color.fromARGB(143, 3, 3, 3),
                      blurRadius: size.width * 0.01,
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    padding: EdgeInsets.only(
                      left: size.height * 0.01,
                    ),
                    dropdownColor: const Color.fromARGB(255, 221, 212, 214),
                    style: TextStyle(
                      height: 0.0,
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.055,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff4A5E7C),
                    ),
                    value: currentItemSelected,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xffA26874),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        currentItemSelected = newValue!;
                        if (currentItemSelected == 'Custom') {
                          customType = true;
                        } else {
                          customType = false;
                        }
                      });
                    },
                    items: eventTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              if (customType)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      heightFactor: 0.0,
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter Your Custom Type',
                        style: TextStyle(
                          height: 0.0,
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.048,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffBEC2CC),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        SizedBox(
                          width: size.width * 0.46,
                          height: size.height * 0.084,
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: size.width * 0.040,
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(255, 37, 40, 50),
                            ),
                            controller: customTypeController,
                            cursorColor: const Color(0xffA26874),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xff4A5E7C),
                                ),
                                borderRadius: BorderRadius.circular(size.width *
                                    0.067), // Same as the container's border radius
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xffA26874),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.067),
                                ),
                              ),
                              // Background color
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/add_event_page_icons/check_custom_type.png',
                            width: size.width * 0.128,
                            height: size.height * 0.135,
                          ),
                          onPressed: () {
                            setState(() {
                              setState(() {
                                String customTypeValue =
                                    customTypeController.text;
                                eventTypes.removeLast();
                                eventTypes.add(customTypeValue);
                                currentItemSelected = customTypeValue;
                                customType = false;
                                customTypeController.clear();
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              Align(
                heightFactor: 0.0,
                alignment: Alignment.topLeft,
                child: Text(
                  'Event Date',
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.048,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xffBEC2CC),
                  ),
                ),
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Container(
                    width: size.width * 0.46,
                    height: size.height * 0.084,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: size.width * 0.002,
                        color: const Color(0xff4A5E7C),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(size.width * 0.067),
                      ),
                      color: const Color(0xffffffff),
                    ),
                    child: Center(
                      child: Text(
                        //to dispaly like 'sun, April 2, 2024'
                        DateFormat('E, MMMM d, y').format(selectedDate),
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff4A5E7C),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/add_event_page_icons/event-calender-date-note-svgrepo-com.png',
                      width: size.width * 0.108,
                      height: size.height * 0.1,
                    ),
                    onPressed: () {
                      setState(() {
                        calenderShowing = !calenderShowing;
                      });
                    },
                  ),
                ],
              ),
              if (calenderShowing)
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.01,
                    bottom: size.height * 0.023,
                  ),
                  child: SfDateRangePicker(
                    showNavigationArrow: true,
                    yearCellStyle: DateRangePickerYearCellStyle(
                      textStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.050,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff4A5E7C),
                      ),
                      todayTextStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffA26874),
                      ),
                    ),
                    selectionColor: const Color(0xffA26874),
                    selectionTextStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.normal,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      textStyle: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.040,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey),
                      todayTextStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffA26874),
                      ),
                    ),
                    headerStyle: DateRangePickerHeaderStyle(
                      textAlign: TextAlign.left,
                      textStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.normal,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      backgroundColor: const Color(0xffA26874),
                    ),
                    showActionButtons: true,
                    backgroundColor: const Color(0xffffffff),
                    todayHighlightColor: const Color(0xff4A5E7C),
                    view: DateRangePickerView.month,
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                        firstDayOfWeek: 1),
                    onSelectionChanged:
                        (DateRangePickerSelectionChangedArgs args) {
                      setState(() {
                        previousDate = selectedDate;
                        selectedDate = args.value;
                      });
                    },
                    onSubmit: (p0) => setState(
                      () {
                        calenderShowing = false;
                      },
                    ),
                    onCancel: () => setState(
                      () {
                        selectedDate = previousDate;
                        calenderShowing = false;
                      },
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Event time',
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.048,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xffBEC2CC),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: size.width * 0.04,
                    ),
                    width: size.width * 0.36,
                    height: size.height * 0.084,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: size.width * 0.002,
                        color: const Color(0xff4A5E7C),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(size.width * 0.067),
                      ),
                      color: const Color(0xffffffff),
                    ),
                    child: Text(
                      reminderTime.format(context),
                      style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff4A5E7C),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Theme(
                    data: ThemeData(
                      primarySwatch: Colors.blue,
                      timePickerTheme: TimePickerThemeData(
                        helpTextStyle: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff4A5E7C),
                        ),
                        backgroundColor: const Color(0xffEFE7E7),
                        elevation: 0.0,
                        cancelButtonStyle: ButtonStyle(
                          foregroundColor:
                              const MaterialStatePropertyAll(Color(0xff4A5E7C)),
                          textStyle: MaterialStatePropertyAll(
                            TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff4A5E7C),
                            ),
                          ),
                        ),
                        confirmButtonStyle: ButtonStyle(
                          foregroundColor:
                              const MaterialStatePropertyAll(Color(0xff4A5E7C)),
                          textStyle: MaterialStatePropertyAll(
                            TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff4A5E7C),
                            ),
                          ),
                        ),
                        dialBackgroundColor: const Color(0xffffffff),
                        entryModeIconColor: const Color(0xffA26874),
                        hourMinuteTextStyle: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.085,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff4A5E7C),
                        ),
                        dayPeriodTextStyle: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff4A5E7C),
                        ),
                        dialTextStyle: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff4A5E7C),
                        ),
                        dayPeriodTextColor: const Color(0xffffffff),
                        dayPeriodColor:
                            const Color(0xff4A5E7C), //Background of AM/PM.
                        dialHandColor: const Color(0xff4A5E7C),
                        dialTextColor: const Color(0xffA26874),
                        hourMinuteTextColor: const Color(0xffffffff),
                        hourMinuteColor: const Color(0xffA26874),
                      ),
                    ),
                    child: Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: Image.asset(
                            'assets/icons/add_event_page_icons/alarm-clock-deadline-svgrepo-com.png',
                            width: size.width * 0.08893,
                            height: size.height * 0.08893,
                          ),
                          onPressed: () async {
                            final TimeOfDay? timeOfDay = await showTimePicker(
                              context: context,
                              initialTime: reminderTime,
                              initialEntryMode: TimePickerEntryMode.dial,
                            );
                            if (timeOfDay != null) {
                              setState(() {
                                reminderTime = timeOfDay;
                              });
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          // Align buttons at the ends
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffB5C0D0),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.028,
                  vertical: size.height * 0.025,
                ), // Adjust the padding as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    size.width * 0.068,
                  ), // Set the border radius of the button
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.06,
                  right: size.width * 0.06,
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  onFinishButtonPressed();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffA26874),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.028,
                  vertical: size.height * 0.025,
                ), // Adjust the padding as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    size.width * 0.068,
                  ), // Set the border radius of the button
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.06,
                  right: size.width * 0.06,
                ),
                child: Text(
                  'Finish',
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

ReminderData createReminderData(
    DateTime selectedDate, TimeOfDay reminderTime, String currentItemSelected) {
  // Extracting date components
  final String day = selectedDate.day.toString();
  final String month = DateFormat('MMM').format(selectedDate);
  final String year = selectedDate.year.toString();
  final String weekDay = DateFormat('E').format(selectedDate);

  // Extracting time components
  final String hours = reminderTime.hour.toString().padLeft(2, '0');
  final String period = reminderTime.hour < 12 ? 'AM' : 'PM';
  final String minutes = reminderTime.minute.toString().padLeft(2, '0');

  // Creating the ReminderData object
  return ReminderData(
    day: day,
    month: month,
    year: year,
    weekDay: weekDay,
    hours: hours,
    minutes: minutes,
    reminderType: currentItemSelected,
    night: period, // Set night value as needed
  );
}
