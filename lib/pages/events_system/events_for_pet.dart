import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petapplication/pages/events_system/edit_event_for_pet.dart';

import 'package:petapplication/pages/my_pets_pages/my_pets.dart';
import 'package:petapplication/pages/events_system/add_event_for_pet.dart';
import 'package:petapplication/some_files_to_data/adding_pet_to_firestore.dart';
import 'package:petapplication/some_files_to_data/reminders_api.dart';

class EventsForPetPage extends StatefulWidget {
  const EventsForPetPage({super.key, required this.petInformation});
  final PetsInformation petInformation;
  @override
  State<EventsForPetPage> createState() => _EventsForPetPage();
}

class CustomTime {
  CustomTime({
    required this.hours,
    required this.minutes,
    required this.night,
    required this.checked,
    required this.feedId,
  });
  late String hours;
  late String minutes;
  late String night;
  late String feedId;
  bool checked = false;
}

class ReminderData {
  ReminderData({
    required this.day,
    required this.month,
    required this.reminderType,
    required this.hours,
    required this.minutes,
    required this.night,
    required this.weekDay,
    required this.year,
    required this.petId,
    required this.reminderId,
  });
  late String day;
  late String month;
  late String reminderType;
  late String hours;
  late String minutes;
  late String night;
  late String weekDay;
  late String year;
  late String petId;
  late String reminderId;
}

bool loadingReminders = true;

class _EventsForPetPage extends State<EventsForPetPage> {
  ScrollController controller = ScrollController();

  Color feedTimeColor = const Color.fromARGB(255, 255, 255, 255);
  String currentItemSelected = 'Playing';
  final api = ReminderDataApi();
  void onFinishButtonPressed({required TimeOfDay timeOfDay}) {
    // Create the ReminderData object
    final CustomTime timeData =
        createFeedTime(reminderTime: timeOfDay, context: context);
    bool foundDuplicate = false;
    for (CustomTime time in widget.petInformation.feedTimesForPet) {
      if (time.hours == timeData.hours &&
          time.minutes == timeData.minutes &&
          time.night == timeData.night) {
        foundDuplicate = true;
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
              "It is not possible to set the same feeding time for a single pet more than once, please modify this feed time",
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
      widget.petInformation.feedTimesForPet.add(timeData);
    }
  }

  bool isInSelectionMode = false;
  Set<String> selectedItems = <String>{};
  int feedCountSelected = 0;

  Future<void> fetchReminders() async {
    List<ReminderData?> remindersData = await api
        .fetchRemindersDatafromFirestore(petId: widget.petInformation.petId);

    // Filter out any null values if the list contains nullable types
    List<ReminderData> nonNullRemindersData =
        remindersData.whereType<ReminderData>().toList();

    setState(() {
      widget.petInformation.remindersData = nonNullRemindersData;
      loadingReminders = false;
    });
  }

  @override
  void initState() {
    fetchReminders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final AppBar defaultBar = AppBar(
      backgroundColor: const Color(0xffB5C0D0),
      automaticallyImplyLeading: false,
    );

    final AppBar selectBar = AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              size: size.width * 0.08,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                // Remove elements from feedTimesForPet where feedId is in selectedItems
                widget.petInformation.feedTimesForPet.removeWhere(
                  (i) => selectedItems.contains(i.feedId),
                );
                selectedItems.clear();
              });
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 139, 152, 170),
        title: Text(
          '${selectedItems.length} selected',
          style: TextStyle(
            height: 0.0,
            fontFamily: 'Cosffira',
            fontSize: size.width * 0.07,
            fontWeight: FontWeight.normal,
            color: const Color.fromARGB(255, 255, 255, 255),
            letterSpacing: 0.5,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: size.width * 0.08,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isInSelectionMode = false;
              selectedItems.clear();
            });
          },
        ));

    return SafeArea(
      child: Scaffold(
        appBar: isInSelectionMode && selectedItems.isNotEmpty
            ? (selectBar)
            : (defaultBar),
        backgroundColor: const Color(0XffEFE7E7),
        body: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/image/event_for_pet_page_images/reminders_page.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.petInformation.petName,
                    style: TextStyle(
                      height: 0.0,
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.150,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff4A5E7C),
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    '${widget.petInformation.petType} | ${widget.petInformation.petGender}',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.028,
                  ),
                  Text(
                    'Feed Time',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.056,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff4A5E7C),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  widget.petInformation.feedTimesForPet.isEmpty
                      ? Flexible(
                          child: Theme(
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
                                  foregroundColor: const WidgetStatePropertyAll(
                                      Color(0xff4A5E7C)),
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
                                  foregroundColor: const WidgetStatePropertyAll(
                                      Color(0xff4A5E7C)),
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
                                dayPeriodColor: const Color(
                                    0xff4A5E7C), //Background of AM/PM.
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
                                    'assets/icons/events_for_pet_page_icons/add_feed_if_impty.png',
                                    height: size.height * 0.09,
                                    width: size.width * 0.29,
                                    fit: BoxFit.fill,
                                  ),
                                  onPressed: () async {
                                    TimeOfDay reminderTime = TimeOfDay.now();
                                    final TimeOfDay? timeOfFeed =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: reminderTime,
                                      initialEntryMode:
                                          TimePickerEntryMode.dial,
                                    );
                                    if (timeOfFeed != null) {
                                      setState(() {
                                        onFinishButtonPressed(
                                            timeOfDay: timeOfFeed);
                                      });
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      : Flexible(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                              left: size.width * 0.06,
                              bottom: size.height * 0.06,
                            ),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              height: size.height *
                                  0.143, // Set a fixed height for the cards
                              margin: EdgeInsets.symmetric(
                                horizontal: size.height * 0.02,
                              ),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                //this is might be cause of overflow
                                child: Row(
                                  children: [
                                    // this will be dynamic coloumn that depends on the length of list
                                    for (CustomTime i in widget
                                        .petInformation.feedTimesForPet)
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: size.width * 0.06,
                                        ),
                                        child: GestureDetector(
                                          onLongPress: () {
                                            setState(() {
                                              isInSelectionMode = true;

                                              selectedItems.add(i.feedId);
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              if (isInSelectionMode) {
                                                if (selectedItems
                                                    .contains(i.feedId)) {
                                                  selectedItems
                                                      .remove(i.feedId);
                                                } else {
                                                  selectedItems.add(i.feedId);
                                                }
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: size.height * 0.170,
                                            width: size.width * 0.24,
                                            decoration: BoxDecoration(
                                              color: i.checked &&
                                                      !selectedItems
                                                          .contains(i.feedId)
                                                  ? const Color(
                                                      0xffA26874) // Case 1: i.checked is true
                                                  : selectedItems
                                                          .contains(i.feedId)
                                                      ? const Color.fromARGB(
                                                          255,
                                                          139,
                                                          152,
                                                          170) // Case 2: i.checked is false but the item is selected
                                                      : const Color(0xffEFE7E7),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    size.width * 0.3),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() =>
                                                        i.checked = !i.checked);
                                                  },
                                                  icon: Image.asset(
                                                    i.checked
                                                        ? "assets/icons/events_for_pet_page_icons/check_yes.png"
                                                        : "assets/icons/events_for_pet_page_icons/Ellipse_icon_for_feed.png",
                                                    height: size.height * 0.060,
                                                    width: size.width * 0.054,
                                                  ),
                                                ),
                                                Text(
                                                  '${i.hours}:${i.minutes}\n ${i.night}',
                                                  style: TextStyle(
                                                    height: 0.0,
                                                    fontFamily: 'Cosffira',
                                                    fontSize:
                                                        size.width * 0.056,
                                                    fontWeight: FontWeight.w800,
                                                    color: i.checked
                                                        ? const Color(
                                                            0xffEFE7E7)
                                                        : const Color(
                                                            0xff4A5E7C),
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                                          backgroundColor:
                                              const Color(0xffEFE7E7),
                                          elevation: 0.0,
                                          cancelButtonStyle: ButtonStyle(
                                            foregroundColor:
                                                const WidgetStatePropertyAll(
                                                    Color(0xff4A5E7C)),
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
                                                const WidgetStatePropertyAll(
                                                    Color(0xff4A5E7C)),
                                            textStyle: WidgetStatePropertyAll(
                                              TextStyle(
                                                fontFamily: 'Cosffira',
                                                fontSize: size.width * 0.045,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff4A5E7C),
                                              ),
                                            ),
                                          ),
                                          dialBackgroundColor:
                                              const Color(0xffffffff),
                                          entryModeIconColor:
                                              const Color(0xffA26874),
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
                                          dayPeriodTextColor:
                                              const Color(0xffffffff),
                                          dayPeriodColor: const Color(
                                              0xff4A5E7C), //Background of AM/PM.
                                          dialHandColor:
                                              const Color(0xff4A5E7C),
                                          dialTextColor:
                                              const Color(0xffA26874),
                                          hourMinuteTextColor:
                                              const Color(0xffffffff),
                                          hourMinuteColor:
                                              const Color(0xffA26874),
                                        ),
                                      ),
                                      child: Builder(
                                        builder: (BuildContext context) {
                                          return IconButton(
                                            icon: Image.asset(
                                              'assets/icons/events_for_pet_page_icons/add_feed_in_list.png',
                                              height: size.height * 0.170,
                                              width: size.width * 0.24,
                                              fit: BoxFit.fill,
                                            ),
                                            onPressed: () async {
                                              TimeOfDay reminderTime =
                                                  TimeOfDay.now();
                                              final TimeOfDay? timeOfFeed =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: reminderTime,
                                                initialEntryMode:
                                                    TimePickerEntryMode.dial,
                                              );
                                              if (timeOfFeed != null) {
                                                setState(() {
                                                  onFinishButtonPressed(
                                                    timeOfDay: timeOfFeed,
                                                  );
                                                });
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tasks For ',
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.056,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff4A5E7C),
                  ),
                ),
                Text(
                  widget.petInformation.petName,
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.066,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xffA26874),
                  ),
                ),
              ],
            ),
            SizedBox(
              height:
                  loadingReminders ? size.height * 0.08 : size.height * 0.02,
            ),
            loadingReminders
                ? Center(
                    child: SizedBox(
                      height: size.height * 0.04,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator.adaptive(
                            strokeWidth: size.height * 0.0023,
                            backgroundColor:
                                const Color.fromARGB(60, 58, 54, 54),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(170, 162, 104, 116),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            'Fetching pet reminders.....',
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: size.width * 0.048,
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(60, 58, 54, 54),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : widget.petInformation.remindersData.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.04,
                                  bottom: size.height * 0.01),
                              child: Text(
                                'you don\'t have tasks yet, please \n        add some events',
                                style: TextStyle(
                                  fontFamily: 'Cosffira',
                                  fontSize: size.width * 0.048,
                                  fontWeight: FontWeight.normal,
                                  color: const Color.fromARGB(60, 58, 54, 54),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await showDialog(
                                    context: context,
                                    builder: (context) => AddTaskDialog(
                                        petInfo: widget.petInformation));
                                setState(() {});
                              },
                              icon: Image.asset(
                                'assets/icons/events_for_pet_page_icons/add_reminder_icon.png',
                                height: size.width * 0.19,
                                width: size.width * 0.29,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Flexible(
                        child: ListView.builder(
                            controller: controller,
                            itemCount:
                                widget.petInformation.remindersData.length + 1,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (index <
                                  widget.petInformation.remindersData.length) {
                                final ReminderData remainder =
                                    widget.petInformation.remindersData[index];
                                return BuildReminder(
                                  reminderData: remainder,
                                  petInformation: widget.petInformation,
                                );
                              } else {
                                return IconButton(
                                  onPressed: () async {
                                    await showDialog(
                                        context: context,
                                        builder: (context) => AddTaskDialog(
                                            petInfo: widget.petInformation));
                                    setState(() {});
                                  },
                                  icon: Image.asset(
                                    'assets/icons/events_for_pet_page_icons/add_reminder_icon.png',
                                    height: size.width * 0.19,
                                    width: size.width * 0.29,
                                    fit: BoxFit.fill,
                                  ),
                                );
                              }
                            }),
                      )
          ],
        ),
      ),
    );
  }
}

class BuildReminder extends StatefulWidget {
  const BuildReminder({
    super.key,
    required this.reminderData,
    required this.petInformation,
  });
  final ReminderData reminderData;
  final PetsInformation petInformation;
  @override
  State<BuildReminder> createState() => _BuildReminder();
}

class _BuildReminder extends State<BuildReminder> {
  @override
  Widget build(BuildContext context) {
    bool deleting = false;
    return Container(
      height: size.height * 0.10,
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(
          Radius.circular(size.width * 0.06),
        ),
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(54, 0, 0, 0),
              blurRadius: size.width * 0.020),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.reminderData.day,
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.072,
                    fontWeight: FontWeight.w800,
                    color: const Color(0XffA26874),
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  widget.reminderData.month,
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.048,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(155, 74, 94, 128),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.reminderData.reminderType,
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.063,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromARGB(255, 81, 102, 133),
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  '${widget.reminderData.weekDay}${widget.reminderData.year}, ${widget.reminderData.hours}:${widget.reminderData.minutes} ${widget.reminderData.night}',
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.045,
                    height: 0.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(109, 74, 94, 124),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.25,
            ),
            PopupMenuButton<String>(
              elevation: 0.0,
              color: const Color.fromARGB(255, 81, 102, 133),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.045,
                        height: 0.0,
                        fontWeight: FontWeight.normal,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        letterSpacing: 0.5,
                      ),
                    ),
                    onTap: () async {
                      final api = ReminderDataApi();
                      MergedReminderData reminderData =
                          api.mergedReminderData(widget.reminderData);
                      await showDialog(
                          context: context,
                          builder: (context) => EditReminder(
                              petInfo: widget.petInformation,
                              reciervedDate: reminderData.getrReminderDate(),
                              reciervedTime: reminderData.getReminderTime(),
                              reciervedType: widget.reminderData.reminderType,
                              reminderId: widget.reminderData.reminderId));
                      setState(() {});
                    },
                  ),
                  PopupMenuItem(
                    value: 'Delete',
                    child: deleting
                        ? const CircularProgressIndicator()
                        : Text(
                            'Delete',
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: size.width * 0.045,
                              height: 0.0,
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              letterSpacing: 0.5,
                            ),
                          ),
                    onTap: () async {
                      setState(() {
                        deleting = true;
                      });

                      try {
                        final api = ReminderDataApi();
                        await api.deleteReminder(
                            reminderId: widget.reminderData.reminderId,
                            petId: widget.reminderData.petId);

                        // Remove the deleted reminder from the list
                        widget.petInformation.remindersData.removeWhere(
                            (reminder) =>
                                reminder.reminderId ==
                                widget.reminderData.reminderId);

                        // Update the state after the deletion
                        setState(() {
                          deleting = false;
                        });
                      } catch (e) {
                        // Handle the exception and update the state
                        setState(() {
                          deleting = false;
                        });
                        print('Error deleting reminder: $e');
                      }
                    },
                  ),
                ];
              },
              child: Image.asset(
                "assets/icons/events_for_pet_page_icons/option_icon.png",
                height: size.height * 0.061,
                width: size.width * 0.016,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
