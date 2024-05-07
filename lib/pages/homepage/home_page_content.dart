import 'package:flutter/material.dart';
import 'package:petapplication/pages/homepage/scrolled_events.dart';
import 'package:petapplication/pages/homepage/scrolled_reminder.dart';
import 'package:petapplication/pages/my_pets_pages/my_pets.dart';
import 'package:petapplication/some_files_to_data/today_and_future_reminders_data.dart';

/* We will use a stateful widget for this page since the content contains a dynamic variable. */
class HomePageAfterAddingPets extends StatefulWidget {
  const HomePageAfterAddingPets({super.key});
  @override
  // intialize the object of HomePageAfterAddingTheReminders to set state for it
  State<HomePageAfterAddingPets> createState() => _HomePageAfterAddingPets();
}

// Create an instance of ScrolledEvents

// List to store card widgets for reminders
List<Widget> itemsData = [];
// These variables allow Textbuttons to change their style when pressed.
// "textColor" variable refers to the color of the text button for today's tasks before it is pressed.
Color textColor = const Color(0xff4A5E7C);
/* 
   The boolean variable "onPressedText" is used to determine the color 
   of the text button for today's tasks after it has been pressed. 
   If the user has not yet pressed the button, the variable will be false.
   However, since the button will be initially pressed,
   the variable is set to true.
*/
bool onPressedText = true;
/* 
  The variables "textColor2" and "onPressedText2" are similar to
  "textColor" and "onPressedText", respectively, but they are used
  specifically for the TextButton "Checked Tasks". When you press
  the "Checked Tasks" button, the color of "Today's Tasks" will 
  change to gray while the value of the "OnPressed" variable will be false.
  The same action will occur in reverse when you press "Today's Tasks".
*/
Color textColor2 = const Color(0xff9A9EAC);
bool onPressedText2 = false;
List<FutureEventsInformations> petsInformationList = [];

// State class for the home page
class _HomePageAfterAddingPets extends State<HomePageAfterAddingPets> {
  // we create an object of "scrolledEvents" to control showing when scrolling.
  // Scroll controller to control the scrolling behavior
  ScrollController controller = ScrollController();
  // Boolean variable to manage the visibility of events as scrolling occurs
  bool closeTopevents = false;
  double topContainer = 0;
  List<Reminders> remindersInHome = [];

  // Method to get reminder cards

  void getCards() {
    setState(() {
      remindersInHome = mergeReminders(
        dogsInformationList,
        catsInformationList,
      );

      petsInformationList = getFutureEvents(
        dogsInformationList,
        catsInformationList,
      );
      if (remindersInHome.isNotEmpty) {
        // Update itemsData with reminder cards
        itemsData = remindersInHome
            .map((item) => BuildReminderCard(
                  remindersData: item,
                  onPressed: () {
                    setState(() {
                      item.checked = !item.checked;
                    });
                  },
                ))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCards();
    print(petsInformationList.length);
  }

  ScrolledEvents scrolledEvents =
      ScrolledEvents(petsInformationList: petsInformationList);

  // Build the UI for the home page
  @override
  Widget build(BuildContext context) {
    // Calculate the height of the event container based on the screen size
    final Size size = MediaQuery.of(context).size;

    // Scaffold widget containing the app structure
    return
        // Body of the app containing various UI elements
        Container(
      height: size.height,
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

          // Animated container for future events cards
          // the same explain for "Animated container for future events text"
          petsInformationList.isNotEmpty
              ? Container(
                  width: size.width,
                  alignment: Alignment.topCenter,
                  // When we scroll, the reminders feature events will appear at a height of 0.
                  height: size.height * 0.15,
                  // We will apply this animation on the 'scrolledEvents' object.
                  child: scrolledEvents)
              : Padding(
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
                ),

          // Row containing TextButtons for Today Tasks and Complete Tasks
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
              // Button for Complete Tasks
              TextButton(
                onPressed: () {
                  // Set the state when Complete Tasks button is pressed
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
          // Expanded ListView to display dynamic items
          /* 
                  Expanded:  It is used to indicate that a widget
                  should take up as much available space as possible
                  along the axis in which it is placed. Typically,
                  it is used within a Column or Row to specify how much
                  of the available vertical or horizontal space a child widget should occupy.
                */
          remindersInHome.isNotEmpty
              ? Builder(builder: (_) {
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
                          onPressed: () {
                            setState(() => passedReminder.checked =
                                !passedReminder.checked);
                          },
                        );
                        // return itemsData[index];
                      },
                    ),
                  );
                })
              : Expanded(
                  child: Padding(
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
                  ),
                ),
        ],
      ),
    );
  }
}
