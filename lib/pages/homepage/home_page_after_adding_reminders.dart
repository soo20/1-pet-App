import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petapplication/pages/homepage/scrolled_events.dart';
import 'package:petapplication/pages/homepage/scrolled_reminder.dart';
import 'package:provider/provider.dart';

/* We will use a stateful widget for this page since the content contains a dynamic variable. */
class HomePageAfterAddingPets extends StatefulWidget {
  const HomePageAfterAddingPets({super.key});
  @override
  // intialize the object of HomePageAfterAddingTheReminders to set state for it
  State<HomePageAfterAddingPets> createState() => _HomePageAfterAddingPets();
}

// Create an instance of ScrolledEvents
const ScrolledEvents scrolledEvents = ScrolledEvents();
// List to store card widgets for reminders
List<Widget> itemsData = [];
// These variables allow Textbuttons to change their style when pressed.
// "textColor" variable refers to the color of the text button for today's tasks before it is pressed.
Color textColor = const Color(0xff2A606C);
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
Color textColor2 = const Color(0xffADBCBF);
bool onPressedText2 = false;

// State class for the home page
class _HomePageAfterAddingPets extends State<HomePageAfterAddingPets> {
  // we create an object of "scrolledEvents" to control showing when scrolling.
  // Scroll controller to control the scrolling behavior
  ScrollController controller = ScrollController();
  // Boolean variable to manage the visibility of events as scrolling occurs
  bool closeTopevents = false;
  double topContainer = 0;
  List<Widget> checkedList = [];

  // Method to get reminder cards
  void getCards() {
    // List containing data for each reminder card
    List<dynamic> responseList = Reminders.reminderInformationList;
    List<Widget> listItems = [];

    // Iterate through the responseList to create reminder cards
    for (final Reminders item in responseList) {
      listItems.add(BuildReminderCard(
        remindersData: item,
        onPressed: () {
          setState(() => item.checked = !item.checked);
        },
      ));
    }
    setState(() {
      // to store cards in itemsData variable and make a state for this
      itemsData = listItems;
    });
  }

  @override
  // Initialize the state and add listeners
  void initState() {
    super.initState();
    // Get reminder cards
    // getCards();
    // Add a listener to the scroll controller for scrolling behavior
    controller.addListener(() {
      // Calculate the ratio of the current scroll offset to a specific value (119 in this case)
      double value = controller.offset / 119;
      // Update the state based on the calculated values
      setState(() {
        // Update the topContainer value with the calculated ratio
        topContainer = value;
        // Update the closeTopevents variable based on the scroll offset
        closeTopevents = controller.offset > 50;
      });
    });
  }

  // Index variable for the bottom navigation bar

  // Build the UI for the home page
  @override
  Widget build(BuildContext context) {
    // Calculate the height of the event container based on the screen size
    final Size size = MediaQuery.of(context).size;
    final double eventHeight;
    if (size.height <= 707.4285714285714) {
      eventHeight = MediaQuery.of(context).size.height * 0.21 - 50;
    } else {
      eventHeight = MediaQuery.of(context).size.height * 0.22 - 50;
    }
    // Scaffold widget containing the app structure
    return
        // Body of the app containing various UI elements
        Container(
      height: size.height,
      margin: EdgeInsets.all(size.height * 0.008),
      child: Column(
        children: <Widget>[
          // Animated container for future events text
          AnimatedOpacity(
            // Duration of the opacity animation (fade in/out)
            duration: const Duration(milliseconds: 1000),
            // The opacity is set to 0 (completely transparent) when
            // closeTopevents is true, and 1 (completely opaque) otherwise.
            opacity: closeTopevents ? 0 : 1,
            // This widget animates its size, position, and other properties.
            child: AnimatedContainer(
              // The total duration of the container size and position
              // animation is set to 600 milliseconds (0.6 seconds).
              duration: const Duration(milliseconds: 600),
              width: size.width,
              alignment: Alignment.centerLeft,
              height: closeTopevents ? 0 : size.height * 0.065,
              padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width * 0.02,
                  bottom: 0.0,
                  top: 0.0),
              child: Text(
                'Future Events',
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: size.width * 0.090,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xff2A606C),
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
          ),
          // Animated container for future events cards
          // the same explain for "Animated container for future events text"
          AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: closeTopevents ? 0 : 1,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                width: size.width,
                alignment: Alignment.topCenter,
                // When we scroll, the reminders feature events will appear at a height of 0.
                height: closeTopevents ? 0 : eventHeight,
                // We will apply this animation on the 'scrolledEvents' object.
                child: scrolledEvents),
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
                    textColor = const Color(0xff2A606C);
                    textColor2 = const Color(0xffADBCBF);
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
                    textColor2 = const Color(0xff2A606C);
                    textColor = const Color(0xffADBCBF);
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

          Builder(builder: (_) {
            final List itemList = (onPressedText)
                ? Reminders.reminderInformationList
                    .where((e) => !e.checked)
                    .toList()
                : Reminders.reminderInformationList
                    .where((e) => e.checked)
                    .toList();

            return Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: itemList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final Reminders remainder = itemList[index];
                  return BuildReminderCard(
                    remindersData: remainder,
                    onPressed: () {
                      setState(() => remainder.checked = !remainder.checked);
                    },
                  );
                  // return itemsData[index];
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
