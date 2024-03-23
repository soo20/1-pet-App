import 'package:flutter/material.dart';

late Size size;

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

class MyPetsPage extends StatelessWidget {
  const MyPetsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BuildPetCard extends StatelessWidget {
  BuildPetCard({
    super.key,
    required this.petInfo,
  });
  Reminders petInfo;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SizedBox(
      child: Container(
        height: size.height * 0.150,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(30), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  petInfo.checked
                      ? 'assets/icons/home_page_after_adding_reminders_icons/checked_button.png'
                      : 'assets/icons/home_page_after_adding_reminders_icons/unchecked_button.png',
                  height: 63,
                  width: 65,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Image(
                  image: AssetImage(
                    petInfo.imageUrl,
                  ),
                  width: 150,
                  height: 150,
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
                      padding: const EdgeInsets.only(right: (95.0)),
                      child: Text(
                        petInfo.petName,
                        style: const TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2A606C),
                        ),
                      ),
                    ),
                    Text(
                      '${petInfo.eventTitle} ${petInfo.time}',
                      style: const TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 46,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(70, 42, 96, 108)),
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
