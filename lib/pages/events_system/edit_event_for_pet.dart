// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/pages/my_pets_pages/my_pets.dart';
import 'package:petapplication/some_files_to_data/adding_pet_to_firestore.dart';
import 'package:petapplication/some_files_to_data/reminders_api.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditReminder extends StatefulWidget {
  const EditReminder({
    super.key,
    required this.petInfo,
    required this.reciervedDate,
    required this.reciervedTime,
    required this.reciervedType,
    required this.reminderId,
    required this.index,
  });

  final PetsInformation petInfo;
  final DateTime reciervedDate;
  final TimeOfDay reciervedTime;
  final String reciervedType;
  final String reminderId;
  final int index;
  @override
  _EditReminderState createState() => _EditReminderState();
}

class _EditReminderState extends State<EditReminder> {
  TimeOfDay reminderTime = TimeOfDay.now();
  late String currentItemSelected;
  bool customType = false;
  bool calenderShowing = false;
  DateTime selectedDate = DateTime.now();
  DateTime previousDate = DateTime.now();
  late TextEditingController customTypeController;
  bool isSending = false;
  List<String> eventTypes = [
    'Gromming',
    'Playing',
    'Medical Checkup',
    'Bathing',
    'Walking',
    'Custom',
  ];
  bool loadedreminder = false;
  @override
  void initState() {
    super.initState();
    currentItemSelected = widget.reciervedType;
    reminderTime = widget.reciervedTime;
    selectedDate = widget.reciervedDate;

    customTypeController = TextEditingController();
    isSending = false;
  }

  @override
  void dispose() {
    customTypeController.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    void onFinishButtonPressed() async {
      setState(() {
        isSending = true;
      });

      try {
        widget.petInfo.remindersData.removeAt(widget.index);
        // Create the ReminderData object
        final reminderApi = ReminderDataApi();
        ReminderData? reminderData = await reminderApi.createReminderData(
            selectedDate, reminderTime, currentItemSelected, widget.petInfo);

        if (reminderData == null) {
          throw Exception("Failed to create reminder data");
        }

        bool foundDuplicate = false;
        for (PetsInformation pet in petsList) {
          for (ReminderData reminder in pet.remindersData) {
            if (reminder.day == reminderData.day &&
                reminder.hours == reminderData.hours &&
                reminder.minutes == reminderData.minutes) {
              foundDuplicate = true;
              break;
            }
          }
          if (foundDuplicate) {
            break;
          }
        }

        if (foundDuplicate) {
          showDialog(
            context: context,
            builder: (BuildContext context) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: size.width * 0.02,
                sigmaY: size.width * 0.02,
              ),
              child: AlertDialog(
                elevation: 0.0,
                backgroundColor: const Color(0xffDCD3D3),
                content: Text(
                  textAlign: TextAlign.center,
                  "It is not possible to set the same reminder more than once. Please choose a different time.",
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.037,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff4A5E7C),
                    letterSpacing: 0.5,
                  ),
                ),
                actions: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffA26874),
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.028,
                          vertical: size.height * 0.025,
                        ), // Adjust the padding as needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            size.width * 0.092,
                          ), // Set the border radius of the button
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.06,
                          right: size.width * 0.06,
                        ),
                        child: Text(
                          'modify',
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
                  ),
                ],
              ),
            ),
          );
        } else {
          try {
            // Check if the reminder document exists before updating
            DocumentSnapshot doc = await FirebaseFirestore.instance
                .collection('reminders')
                .doc(widget.reminderId)
                .get();

            if (doc.exists) {
              await ReminderDataApi().updateReminder(
                reminderId: widget.reminderId,
                selectedDate: selectedDate,
                reminderType: currentItemSelected,
                reminderTime: reminderTime,
                petId: widget.petInfo.petId,
              );
              loadedreminder = true;
            } else {
              throw Exception("Reminder does not exist");
            }
          } catch (e) {
            loadedreminder = false;
            print("Error updating reminder: $e");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Failed to update the reminder."),
                duration: Duration(seconds: 3),
              ),
            );
          }

          Navigator.of(context).pop();

          if (loadedreminder) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Reminder updated successfully"),
                duration: Duration(seconds: 3),
              ),
            );
          }
        }
      } catch (e) {
        print("Error onFinishButtonPressed: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to create reminder data."),
            duration: Duration(seconds: 3),
          ),
        );
      } finally {
        setState(() {
          isSending = false;
        });
      }
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
        'Edit A Reminder',
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
                              const WidgetStatePropertyAll(Color(0xff4A5E7C)),
                          textStyle: WidgetStatePropertyAll(
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
                              const WidgetStatePropertyAll(Color(0xff4A5E7C)),
                          textStyle: WidgetStatePropertyAll(
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
                child: loadedreminder
                    ? const CircularProgressIndicator()
                    : Text(
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
