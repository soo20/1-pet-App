import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petapplication/pages/homepage/scrolled_events.dart';
import 'package:petapplication/pages/homepage/scrolled_reminder.dart';

/*We will use a stateful widget for this page since the content contains a dynamic variable.*/
class HomePageAfterAddingPets extends StatefulWidget {
  const HomePageAfterAddingPets({super.key});
  @override
  //intialize the object of HomePageAfterAddingTheReminders to set state for it
  State<HomePageAfterAddingPets> createState() => _HomePageAfterAddingPets();
}

const ScrolledEvents scrolledEvents = ScrolledEvents();
List<Widget> itemsData = [];
Color textColor = const Color(0xffADBCBF);
bool onPressedText = true;
Color textColor2 = const Color(0xffADBCBF);
bool onPressedText2 = false;

class _HomePageAfterAddingPets extends State<HomePageAfterAddingPets> {
  //we create an object of "scrolledEvents" to control showing when scrolling.

  ScrollController controller = ScrollController();

  /*We have created a Boolean variable to manage the visibility of events.
     This variable allows us to control the hiding and showing of events as
      scrolling the page*/
  bool closeTopevents = false;
  double topContainer = 0;

  void getCards() {
    List<dynamic> responseList = Reminders.reminderInformationList;
    List<Widget> listItems = [];
    responseList.forEach(
      (item) => listItems.add(buildReminderCard(item)),
    );
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getCards();
    controller.addListener(() {
      double value = controller.offset / 119;
      setState(() {
        topContainer = value;
        closeTopevents = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double eventHeight = MediaQuery.of(context).size.height * 0.25 - 50;
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          items: const [
            CurvedNavigationBarItem(
              child: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.search),
              label: 'Search',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.chat_bubble_outline),
              label: 'Chat',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.newspaper),
              label: 'Feed',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.perm_identity),
              label: 'Personal',
            ),
          ],
        ),
        backgroundColor: const Color(0xffEEEFEF),
        appBar: AppBar(
          //to remove any shadow
          elevation: 0.0,
          //to make the same color to the entire home screen
          backgroundColor: const Color(0xffEEEFEF),
          //leading this will put the icon in thr left of app bar as we want to put
          leading: IconButton(
            icon: const Icon(Icons.settings, color: Color(0xff2A606C)),
            onPressed: () {},
            iconSize: 90.sp,
          ),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                top: 10.0,
                right: 0.0,
              ),
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
        body: Container(
          height: size.height,
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: closeTopevents ? 0 : 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  width: size.width,
                  alignment: Alignment.topCenter,
                  height: closeTopevents ? 0 : eventHeight + 90.h,
                  child: scrolledEvents,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      onPressedText = true;
                      onPressedText2 = false;
                      textColor = const Color(0xff2A606C);
                      textColor2 = const Color(0xffADBCBF);
                    },
                    child: Text('Today Tasks',
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 60.sp,
                          fontWeight: FontWeight.w800,
                          color: textColor,
                          shadows: [
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
                  TextButton(
                    onPressed: () {
                      onPressedText2 = true;
                      onPressedText = false;
                      textColor2 = const Color(0xff2A606C);
                      textColor = const Color(0xffADBCBF);
                    },
                    child: Text('Complete Tasks',
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 60.sp,
                          fontWeight: FontWeight.w800,
                          color: textColor2,
                          shadows: [
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
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: itemsData.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return itemsData[index];
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
