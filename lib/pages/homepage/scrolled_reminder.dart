import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrolledReminders extends StatefulWidget {
  const ScrolledReminders({super.key});
  @override
  State<ScrolledReminders> createState() => _ScrolledReminders();
}

class _ScrolledReminders extends State<ScrolledReminders> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Reminders.petsInformationList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildEventCard(Reminders.petsInformationList[index]);
      },
    );
  }
}

class Reminders {
  Reminders({
    required this.imageUrl,
    required this.eventTitle,
    required this.eventDate,
    required this.petName,
  });
  late String imageUrl;
  late String eventTitle;
  late String eventDate;
  late String petName;

  static List<Reminders> petsInformationList = [
    Reminders(
      imageUrl:
          'assets/image/home_page_afterAdding_pets_assets/dog_for_events.png',
      eventTitle: 'Picnic With Dog',
      eventDate: 'Sat, Jule24 ,9:00',
      petName: 'Max',
    ),
    Reminders(
      imageUrl:
          'assets/image/home_page_afterAdding_pets_assets/cat_for_events.png',
      eventTitle: 'Go To Vet',
      eventDate: 'Sat, Jule26 ,1:00',
      petName: 'luna',
    ),
    Reminders(
      imageUrl:
          'assets/icons/home_page_after_adding_reminders_icons/dog_for_events.png',
      eventTitle: 'Picnic With Dog',
      eventDate: 'Sat, Jule24 ,9:00',
      petName: 'Max',
    ),
    Reminders(
      imageUrl:
          'assets/image/home_page_afterAdding_pets_assets/cat_for_events.png',
      eventTitle: 'Go To Vet',
      eventDate: 'Sat, Jule26 ,1:00',
      petName: 'luna',
    ),
  ];
}

Widget buildEventCard(Reminders petInformation) {
  return Card(
    color: const Color(0xffffffff),
    elevation: 0.0,
    child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              petInformation.eventTitle,
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 42.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              petInformation.eventDate,
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 42.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  foregroundColor:
                      const MaterialStatePropertyAll(Color(0xff2A606C)),
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xffFEF7EA))),
              onPressed: () {},
              child: Text(petInformation.petName),
            ),
          ],
        ),
        Image(
          image: AssetImage(
            petInformation.imageUrl,
          ),
        )
      ],
    ),
  );
}
