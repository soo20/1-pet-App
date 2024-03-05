import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  static List<dynamic> reminderInformationList = [
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

Widget buildReminderCard(Reminders petInformation) {
  return SizedBox(
    child: Container(
      height: 200.h,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(30), blurRadius: 10.0.r),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/home_page_after_adding_reminders_icons/Rectangle_button.png',
                height: 63.h,
                width: 65.w,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image(
                image: AssetImage(
                  petInformation.imageUrl,
                ),
                width: 150.w,
                height: 150.h,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 5.0,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 95.0),
                    child: Text(
                      textAlign: TextAlign.left,
                      petInformation.petName,
                      style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 70.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff2A606C),
                      ),
                    ),
                  ),
                  Text(
                    '${petInformation.eventTitle} ${petInformation.time}',
                    style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 46.sp,
                        fontWeight: FontWeight.w100,
                        color: const Color.fromARGB(70, 42, 96, 108)),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/home_page_after_adding_reminders_icons/reminder_options_circles.png',
                height: 63.h,
                width: 65.w,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
