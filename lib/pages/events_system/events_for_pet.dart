import 'package:flutter/material.dart';

import 'package:petapplication/pages/my_pets_pages/my_pets.dart';
import 'package:petapplication/pages/events_system/add_event_for_pet.dart';

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
  });
  late String hours;
  late String minutes;
  late bool night;
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
  });
  late String day;
  late String month;
  late String reminderType;
  late String hours;
  late String minutes;
  late String night;
  late String weekDay;
  late String year;
}

List<CustomTime> feedTimes = [
  CustomTime(
    hours: '4',
    minutes: '22',
    night: true,
    checked: false,
  ),
  CustomTime(
    hours: '4',
    minutes: '22',
    night: true,
    checked: false,
  ),
  CustomTime(
    hours: '4',
    minutes: '22',
    night: false,
    checked: false,
  ),
  CustomTime(
    hours: '4',
    minutes: '22',
    night: false,
    checked: false,
  ),
  CustomTime(
    hours: '4',
    minutes: '22',
    night: false,
    checked: false,
  ),
];

List<ReminderData> remindersForPet = [];

class _EventsForPetPage extends State<EventsForPetPage> {
  ScrollController controller = ScrollController();

  bool closeTopContainer = false;
  double topContainer = 0;
  String currentItemSelected = 'Playing';
  bool showContainer = true;
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
        closeTopContainer = controller.offset > 50;
        showContainer =
            controller.position.pixels <= controller.position.maxScrollExtent ||
                remindersForPet.length < 3;
      });
      controller.position.allowImplicitScrolling;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double topContainerHeight;

    if (size.height <= 707.4285714285714) {
      topContainerHeight = MediaQuery.of(context).size.height * 0.55;
    } else {
      topContainerHeight = MediaQuery.of(context).size.height * 0.55;
    }

    addTaskDialog() => showDialog(
          context: context,
          builder: (context) => const AddTaskDialog(),
        );
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0XffEFE7E7),
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: showContainer ? 1 : 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: size.width,
                  height: closeTopContainer ? 0 : topContainerHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/image/event_for_pet_page_images/reminders_page.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
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
                          height: size.height * 0.048,
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
                        feedTimes.isEmpty
                            ? Flexible(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/icons/events_for_pet_page_icons/add_feed_if_impty.png',
                                    height: size.width * 0.19,
                                    width: size.width * 0.29,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : Flexible(
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                    left: size.width * 0.06,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
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
                                          for (CustomTime i in feedTimes)
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: size.width * 0.06,
                                              ),
                                              child: Container(
                                                height: size.height * 0.170,
                                                width: size.width * 0.24,
                                                decoration: BoxDecoration(
                                                  color: i.checked
                                                      ? const Color(0xffA26874)
                                                      : const Color(0xffEFE7E7),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        size.width * 0.3),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() =>
                                                            i.checked =
                                                                !i.checked);
                                                      },
                                                      icon: Image.asset(
                                                        i.checked
                                                            ? "assets/icons/events_for_pet_page_icons/check_yes.png"
                                                            : "assets/icons/events_for_pet_page_icons/Ellipse_icon_for_feed.png",
                                                        height:
                                                            size.height * 0.060,
                                                        width:
                                                            size.width * 0.054,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${i.hours}:${i.minutes}\n ${i.night ? 'Pm' : 'Am'}',
                                                      style: TextStyle(
                                                        height: 0.0,
                                                        fontFamily: 'Cosffira',
                                                        fontSize:
                                                            size.width * 0.056,
                                                        fontWeight:
                                                            FontWeight.w800,
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
                                          IconButton(
                                            onPressed: () {
                                              // Get.to(
                                              //   const AddEventPage(),
                                              //   transition: Transition.zoom,
                                              // );
                                            },
                                            icon: Image.asset(
                                              'assets/icons/events_for_pet_page_icons/add_feed_in_list.png',
                                              height: size.height * 0.170,
                                              width: size.width * 0.24,
                                              fit: BoxFit.fill,
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
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff4A5E7C),
                    ),
                  ),
                  Text(
                    widget.petInformation.petName,
                    style: TextStyle(
                      height: 0.0,
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.066,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xffA26874),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              remindersForPet.isEmpty
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
                            onPressed: () {
                              setState(() {
                                addTaskDialog();
                              });
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
                          itemCount: remindersForPet.length + 1,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index < remindersForPet.length) {
                              final ReminderData remainder =
                                  remindersForPet[index];
                              return BuildReminder(reminderData: remainder);
                            } else {
                              return IconButton(
                                onPressed: () {
                                  setState(() {
                                    addTaskDialog();
                                  });
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
      ),
    );
  }
}

class BuildReminder extends StatelessWidget {
  const BuildReminder({
    super.key,
    required this.reminderData,
  });
  final ReminderData reminderData;
  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              width: size.width * 0.036,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  reminderData.day,
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
                  reminderData.month,
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
              width: size.width * 0.020,
            ),
            Text(
              reminderData.reminderType,
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: size.width * 0.063,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(255, 81, 102, 133),
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              width: size.width * 0.06,
            ),
            Text(
              '${reminderData.weekDay}${reminderData.year}, ${reminderData.hours}:${reminderData.minutes} ${reminderData.night}',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: size.width * 0.045,
                height: 0.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(109, 74, 94, 124),
                letterSpacing: 0.5,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
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
