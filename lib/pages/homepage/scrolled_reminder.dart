import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrolledReminders extends StatefulWidget {
  const ScrolledReminders({super.key});
  @override
  State<ScrolledReminders> createState() => _ScrolledReminders();
}

class _ScrolledReminders extends State<ScrolledReminders> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 950.h,
      child: ListView.builder(
        itemCount: Reminders.reminderInformationList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildEventCard(Reminders.reminderInformationList[index]);
        },
      ),
    );
  }
}

class Reminders {
  Reminders({
    required this.imageUrl,
    required this.eventTitle,
    required this.time,
    required this.petName,
  });
  late String imageUrl;
  late String eventTitle;
  late String time;
  late String petName;

  static List<Reminders> reminderInformationList = [
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
    ),
  ];
}

Widget buildEventCard(Reminders petInformation) {
  return Card(
    color: const Color(0xffffffff),
    elevation: 0.8,
    shadowColor: const Color(0xff000000),
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(
              petInformation.imageUrl,
            ),
            width: 120.w,
            height: 120.h,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 60.0,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 85.0),
                child: Text(
                  textAlign: TextAlign.left,
                  petInformation.petName,
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 67.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff2A606C),
                  ),
                ),
              ),
              Text(
                '${petInformation.eventTitle} ${petInformation.time}',
                style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w100,
                    color: const Color.fromARGB(70, 42, 96, 108)),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/icons/home_page_after_adding_reminders_icons/Rectangle_button.png',
            height: 63.h,
            width: 65.w,
          ),
        )
      ],
    ),
  );
}
