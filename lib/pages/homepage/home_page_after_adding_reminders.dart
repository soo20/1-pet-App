import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petapplication/pages/homepage/scrolled_events.dart';
import 'package:petapplication/pages/homepage/scrolled_reminder.dart';

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

  void uncheckCard(Reminders petInformation) {
    setState(() {
      petInformation.checked = false;
      itemsData.add(
          buildReminderCard(petInformation, checkCard, uncheckCard, moveCard));
      checkedList.removeWhere(
          (item) => (item).key == Key(petInformation.reminderId.toString()));
    });
  }

  void moveCard(Reminders petInformation) {
    if (petInformation.checked) {
      uncheckCard(petInformation);
    } else {
      checkCard(petInformation);
    }
  }

  void checkCard(Reminders petInformation) {
    setState(() {
      petInformation.checked = true;
      Widget card =
          buildReminderCard(petInformation, checkCard, uncheckCard, moveCard);
      checkedList.add(card);
      itemsData.removeWhere((item) => (item).key == card.key);
    });
  }

  // Method to get reminder cards
  void getCards() {
    // List containing data for each reminder card
    List<dynamic> responseList = Reminders.reminderInformationList;
    List<Widget> listItems = [];

    // Iterate through the responseList to create reminder cards
    for (var item in responseList) {
      listItems.add(buildReminderCard(item, checkCard, uncheckCard, moveCard));
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
    getCards();
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
  var index = 0;
  // Build the UI for the home page
  @override
  Widget build(BuildContext context) {
    // Calculate the height of the event container based on the screen size
    final double eventHeight = MediaQuery.of(context).size.height * 0.22 - 50;
    final Size size = MediaQuery.of(context).size;
    // Scaffold widget containing the app structure
    return SafeArea(
      child: Scaffold(
        // Bottom navigation bar
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          onTap: (index) => setState(() => this.index = index),
          // Set no padding on the "add pet" nav bar item to be in a suitable size when tapping on it.
          iconPadding: index == 3 ? 0 : 12,
          // to change the icon color when tap on it
          buttonBackgroundColor: const Color(0xff2A606C),
          // Bottom navigation bar height
          height: 170.17.h,
          // Bottom navigation bar items
          items: [
            CurvedNavigationBarItem(
              child: index == 0
                  // to change the color of the icon to white when tapping on this item.
                  ? Image.asset(
                      'assets/icons/home_page_after_adding_reminders_icons/home_icon_on_pressed.png',
                      width: 103.49.w,
                      height: 69.53.h,
                    )
                  : Image.asset(
                      'assets/icons/home_page_after_adding_reminders_icons/home_icon_before_pressed.png',
                      width: 103.49.w,
                      height: 69.53.h,
                    ),
              label: 'Home',
              labelStyle: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 42.sp,
                fontWeight: index == 0 ? FontWeight.w900 : FontWeight.normal,
                color: const Color(0xff2A606C),
              ),
            ),
            CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/home_page_after_adding_reminders_icons/diseases_icon_before_pressed.png',
                width: 103.49.w,
                height: 69.53.h,
              ),
              label: 'Diseases',
              labelStyle: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 42.sp,
                fontWeight: FontWeight.normal,
                color: const Color(0xffADBCBF),
              ),
            ),
            CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/home_page_after_adding_reminders_icons/my_pets_before_pressing.png',
                width: 103.49.w,
                height: 69.53.h,
              ),
              label: 'My pets',
              labelStyle: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 42.sp,
                fontWeight: FontWeight.normal,
                color: const Color(0xffADBCBF),
              ),
            ),
            CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/home_page_after_adding_reminders_icons/add_pet_icon.png',
                width: 149.53.w,
                height: 160.28.h,
              ),
              label: 'Add pet',
              labelStyle: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 42.sp,
                fontWeight: FontWeight.normal,
                color: const Color(0xffADBCBF),
              ),
            ),
          ],
        ),
        // Background color of the body
        backgroundColor: const Color(0xffEEEFEF),
        // App bar at the top of the screen
        appBar: AppBar(
          // Remove any shadow from the app bar
          elevation: 0.0,
          // Set the background color of the app bar
          backgroundColor: const Color(0xffEEEFEF),
          // Leading icon/button on the app bar
          // leading this will put the icon in thr left of app bar as we want to put
          leading: IconButton(
            icon: const Icon(Icons.settings, color: Color(0xff2A606C)),
            onPressed: () {},
            iconSize: 90.sp,
          ),
          // Actions on the app bar
          actions: <Widget>[
            // Container containing user image and button
            Container(
              margin: const EdgeInsets.only(
                top: 10.0,
                right: 0.0,
              ),
              // User image in the app bar
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 0.0,
                      left: 0.0,
                      bottom: 8.0,
                      right: 14.0,
                    ),
                    child: Image.asset(
                      'assets/image/home_page_afterAdding_pets_assets/person_image_in_app_bar.png', // Replace with your image path
                      width: 90.w,
                      height: 90.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Round button on the user image
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/home_page_after_adding_reminders_icons/Round Btn Default Dark.png', // Replace with your image path
                        width: 65.w,
                        height: 65.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Body of the app containing various UI elements
        body: Container(
          height: size.height,
          margin: const EdgeInsets.all(8.0),
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
                  height: closeTopevents ? 0 : 95.h,
                  padding:
                      const EdgeInsets.only(left: 7.0, bottom: 0.0, top: 0.0),
                  child: Text(
                    'Future Events',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 90.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff2A606C),
                      shadows: [
                        Shadow(
                          color: const Color(0xff000000),
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 10.0.r,
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
                          fontSize: 60.sp,
                          fontWeight: FontWeight.w800,
                          color: textColor,
                          shadows: [
                            // To create a Shadow effect only when the Text button is pressed.
                            onPressedText == true
                                ? Shadow(
                                    color: const Color(0xff000000),
                                    offset: const Offset(1.0, 1.0),
                                    blurRadius: 10.0.r,
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
                          fontSize: 60.sp,
                          fontWeight: FontWeight.w800,
                          color: textColor2,
                          shadows: [
                            // Create a shadow effect when the button is pressed
                            onPressedText2 == true
                                ? Shadow(
                                    color: const Color(0xff000000),
                                    offset: const Offset(1.0, 1.0),
                                    blurRadius: 10.0.r,
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
              Expanded(
                child: onPressedText
                    ? ListView.builder(
                        controller: controller,
                        itemCount: itemsData.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return itemsData[index];
                        },
                      )
                    : ListView.builder(
                        controller: controller,
                        itemCount: checkedList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return checkedList[index];
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
