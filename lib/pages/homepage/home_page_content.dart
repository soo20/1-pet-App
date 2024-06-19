// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:petapplication/pages/homepage/scrolled_events.dart';
import 'package:petapplication/pages/homepage/scrolled_reminder.dart';
import 'package:petapplication/some_files_to_data/reminders_api.dart';
import 'package:petapplication/some_files_to_data/today_and_future_reminders_data.dart';

class HomePageAfterAddingPets extends StatefulWidget {
  const HomePageAfterAddingPets({super.key});
  @override
  State<HomePageAfterAddingPets> createState() => _HomePageAfterAddingPets();
}

class _HomePageAfterAddingPets extends State<HomePageAfterAddingPets> {
  // State variables
  ScrollController controller = ScrollController();
  bool closeTopevents = false;
  double topContainer = 0;
  List<Reminders> remindersInHome = [];
  List<FutureEventsInformations> petsInformationList = [];

  // Variables for TextButton states
  Color textColor = const Color(0xff4A5E7C);
  bool onPressedText = true;
  Color textColor2 = const Color(0xff9A9EAC);
  bool onPressedText2 = false;

  late ScrolledEvents scrolledEvents;

  @override
  void initState() {
    super.initState();
    scrolledEvents = ScrolledEvents(petsInformationList: petsInformationList);
  }

  // Build the UI for the home page
  @override
  Widget build(BuildContext context) {
    // Calculate the height of the event container based on the screen size
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      margin: EdgeInsets.all(size.height * 0.008),
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            alignment: Alignment.centerLeft,
            height: size.height * 0.065,
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * 0.02,
              bottom: 0.0,
              top: 0.0,
            ),
            child: Text(
              'Future Events',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: size.width * 0.090,
                fontWeight: FontWeight.w800,
                color: const Color(0xff4A5E7C),
                shadows: [
                  Shadow(
                    color: const Color(0xff000000),
                    offset: Offset(size.width * 0.001, size.width * 0.001),
                    blurRadius: size.width * 0.010,
                  ),
                ],
              ),
            ),
          ),
          // FutureBuilder<List<FutureEventsInformations>>(
          //   future: getFutureEvents(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: SizedBox(
          //           height: size.height * 0.04,
          //           child: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               CircularProgressIndicator.adaptive(
          //                 strokeWidth: size.height * 0.0023,
          //                 backgroundColor: const Color.fromARGB(60, 58, 54, 54),
          //                 valueColor: const AlwaysStoppedAnimation<Color>(
          //                   Color.fromARGB(170, 162, 104, 116),
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: size.width * 0.02,
          //               ),
          //               Text(
          //                 'Fetching future events.....',
          //                 style: TextStyle(
          //                   fontFamily: 'Cosffira',
          //                   fontSize: size.width * 0.048,
          //                   fontWeight: FontWeight.normal,
          //                   color: const Color.fromARGB(60, 58, 54, 54),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       );
          //     } else if (snapshot.hasError) {
          //       print(snapshot.error);
          //       return Text('Error: ${snapshot.error}');
          //     } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          //       List<FutureEventsInformations> petsInformationList =
          //           snapshot.data!;
          //       return Container(
          //         width: size.width,
          //         height: size.height * 0.15,
          //         child:
          //             ScrolledEvents(petsInformationList: petsInformationList),
          //       );
          //     } else {
          //       return Padding(
          //         padding: EdgeInsets.only(
          //           top: size.height * 0.03,
          //           bottom: size.height * 0.03,
          //         ),
          //         child: Text(
          //           "There are no upcoming events yet.",
          //           style: TextStyle(
          //             fontFamily: 'Cosffira',
          //             fontSize: size.width * 0.049,
          //             fontWeight: FontWeight.normal,
          //             color: const Color.fromARGB(145, 154, 158, 172),
          //           ),
          //         ),
          //       );
          //     }
          //   },
          // ),
          FutureBuilder<List<FutureEventsInformations>>(
            future: getFutureEvents(),
            builder: (context, snapshot) {
              print('Snapshot state: ${snapshot.connectionState}');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  width: size.width,
                  height: size.height * 0.15,
                  child: Center(
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
                          SizedBox(width: size.width * 0.02),
                          Text(
                            'Fetching future events.....',
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: size.width * 0.048,
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(60, 58, 54, 54),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                print('Snapshot has data: ${snapshot.data}');
                if (snapshot.data!.isNotEmpty) {
                  petsInformationList = snapshot.data!;
                  return Container(
                    width: size.width,
                    height: size.height * 0.15,
                    child: ScrolledEvents(
                        petsInformationList: petsInformationList),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.03,
                      bottom: size.height * 0.03,
                    ),
                    child: Text(
                      "There are no upcoming events yet.",
                      style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.049,
                        fontWeight: FontWeight.normal,
                        color: const Color.fromARGB(145, 154, 158, 172),
                      ),
                    ),
                  );
                }
              } else {
                return Text('No data available');
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Button for Today Tasks
              TextButton(
                onPressed: () {
                  // Set the state when Today Tasks button is pressed
                  setState(() {
                    onPressedText = true;
                    onPressedText2 = false;
                    textColor = const Color(0xff4A5E7C);
                    textColor2 = const Color(0xff9A9EAC);
                  });
                },
                child: Text('Today Tasks',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.059,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                      shadows: [
                        // To create a Shadow effect only when the Text button is pressed.
                        onPressedText == true
                            ? Shadow(
                                color: const Color(0xff000000),
                                offset: const Offset(1.0, 1.0),
                                blurRadius: size.width * 0.01,
                              )
                            : const Shadow(
                                offset: Offset.zero,
                                blurRadius: 0.0,
                              ),
                      ],
                    )),
              ),

              TextButton(
                onPressed: () {
                  setState(() {
                    onPressedText2 = true;
                    onPressedText = false;
                    textColor2 = const Color(0xff4A5E7C);
                    textColor = const Color(0xff9A9EAC);
                  });
                },
                child: Text('Complete Tasks',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.059,
                      fontWeight: FontWeight.w800,
                      color: textColor2,
                      shadows: [
                        // Create a shadow effect when the button is pressed
                        onPressedText2 == true
                            ? Shadow(
                                color: const Color(0xff000000),
                                offset: const Offset(1.0, 1.0),
                                blurRadius: size.width * 0.010,
                              )
                            : const Shadow(
                                offset: Offset.zero,
                                blurRadius: 0.0,
                              ),
                      ],
                    )),
              ),
            ],
          ),
          // Use FutureBuilder for reminders
          FutureBuilder<List<Reminders>>(
            future: mergeReminders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.1,
                  ),
                  child: Center(
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
                            'Fetching today tasks.....',
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
                  ),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                remindersInHome = snapshot.data!;
                print("hhhhhhhhhhhhhhhhhhhhh");
                final List<Reminders> itemList = (onPressedText)
                    ? remindersInHome.where((e) => !e.checked).toList()
                    : remindersInHome.where((e) => e.checked).toList();

                return Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: itemList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final Reminders passedReminder = itemList[index];
                      return BuildReminderCard(
                        remindersData: passedReminder,
                        onPressed: () async {
                          setState(() {
                            passedReminder.checked = !passedReminder.checked;
                            final reminderApi = ReminderDataApi();
                            if (passedReminder.checked == true) {
                              reminderApi.reminderCheckedState(
                                  value: 't',
                                  reminderId: passedReminder.reminderId);
                            } else {
                              reminderApi.reminderCheckedState(
                                  value: 'f',
                                  reminderId: passedReminder.reminderId);
                            }
                          });
                        },
                      );
                    },
                  ),
                );
              } else if (remindersInHome.isEmpty) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.08,
                  ),
                  child: Text(
                    'You have no tasks for today or you\n    haven\'t created any tasks yet.',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.049,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(145, 154, 158, 172),
                    ),
                  ),
                );
              } else {
                remindersInHome = snapshot.data!;
                print(remindersInHome);

                return Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.08,
                  ),
                  child: Text(
                    'You have no tasks for today or you\n    haven\'t created any tasks yet.',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.049,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(145, 154, 158, 172),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
