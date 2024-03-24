import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reminders extends ChangeNotifier {
  Reminders({
    required this.imageUrl,
    required this.eventTitle,
    required this.time,
    required this.petName,
    this.checked = false,
    required this.reminderId,
  });
  late String imageUrl;
  late String eventTitle;
  late String time;
  late String petName;
  late int reminderId;
  bool checked;

  static List<Reminders> reminderInformationList = [
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 1,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 2,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 3,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 4,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 5,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 6,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 7,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 8,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 9,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 10,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 11,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 12,
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/golden-retriever.png',
      eventTitle: 'Walk outside',
      time: '9:00 Am',
      petName: 'Buby',
      reminderId: 13,
    ),
  ];
}

late Size size;

class BuildReminderCard extends StatelessWidget {
  const BuildReminderCard(
      {super.key, required this.remindersData, required this.onPressed});
  final Reminders remindersData;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.105,
      child: Container(
        height: size.height * 0.105,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(30), blurRadius: 10.0.r),
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.005, vertical: size.height * 0.010),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: onPressed,
                icon: Image.asset(
                  remindersData.checked
                      ? 'assets/icons/home_page_after_adding_reminders_icons/checked_button.png'
                      : 'assets/icons/home_page_after_adding_reminders_icons/unchecked_button.png',
                  height: 63.h,
                  width: 65.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.001),
                child: Image(
                  image: AssetImage(
                    remindersData.imageUrl,
                  ),
                  width: size.width * 0.150,
                  height: size.height * 0.150,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  right: size.width * 0.05,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.3),
                      child: Text(
                        remindersData.petName,
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.070,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff2A606C),
                        ),
                      ),
                    ),
                    Text(
                      '${remindersData.eventTitle} ${remindersData.time}',
                      style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.046,
                          fontWeight: FontWeight.w100,
                          color: const Color.fromARGB(70, 42, 96, 108)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
