import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrolledEvents extends StatefulWidget {
  const ScrolledEvents({super.key});
  @override
  State<ScrolledEvents> createState() => _ScrolledEvents();
}

class _ScrolledEvents extends State<ScrolledEvents> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            //this is might be cause of overflow
            child: Row(
              children: [
                // this will be dynamic coloumn that depends on the length of list
                for (var i in Pets.petsInformationList) buildEventCard(i)
              ],
            )),
      ),
    );
  }
}

class Pets {
  Pets({
    required this.imageUrl,
    required this.eventTitle,
    required this.eventDate,
    required this.petName,
    required this.petType,
  });
  late String imageUrl;
  late String eventTitle;
  late String eventDate;
  late String petName;
  late String petType;

  static List<Pets> petsInformationList = [
    Pets(
      imageUrl:
          'assets/image/home_page_afterAdding_pets_assets/dog_for_events.png',
      eventTitle: 'Picnic With Dog',
      eventDate: 'Sat, Jule24 ,9:00',
      petName: 'Max',
      petType: 'dog',
    ),
    Pets(
      imageUrl:
          'assets/image/home_page_afterAdding_pets_assets/cat_for_events.png',
      eventTitle: 'Go To Vet',
      eventDate: 'Sat, Jule26 ,1:00',
      petName: 'Luna',
      petType: 'cat',
    ),
    Pets(
      imageUrl:
          'assets/image/home_page_afterAdding_pets_assets/dog_for_events.png',
      eventTitle: 'Picnic With Dog',
      eventDate: 'Sat, Jule24 ,9:00',
      petName: 'Max',
      petType: 'dog',
    ),
    Pets(
      imageUrl:
          'assets/image/home_page_afterAdding_pets_assets/cat_for_events.png',
      eventTitle: 'Go To Vet',
      eventDate: 'Sat, Jule26 ,1:00',
      petName: 'Luna',
      petType: 'cat',
    ),
  ];
}

Widget buildEventCard(Pets petInformation) {
  return Card(
    color: petInformation.petType == 'cat'
        ? const Color(0xffE3B1A8)
        : const Color(0xffB8D8D4),
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(36.0.r),
      side: BorderSide(
        color: const Color(0xff707070), // Set the border color
        width: 1.0.w, // Set the border width
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 6.0,
                bottom: 0.0,
                right: 0.0,
              ),
              child: Text(
                petInformation.eventTitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 42.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 0.0),
              child: Text(
                textAlign: TextAlign.justify,
                petInformation.eventDate,
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 42.sp,
                  fontWeight: FontWeight.w100,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            SizedBox(
              width: 90.w,
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(157.w, 53.h)),
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 39.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  foregroundColor:
                      const MaterialStatePropertyAll(Color(0xff2A606C)),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 248, 241, 227),
                  ),
                ),
                onPressed: () {},
                child: Text(petInformation.petName),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 90.w,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
          child: Image(
            image: AssetImage(
              petInformation.imageUrl,
            ),
            width: 323.w,
            height: 256.h,
            fit: BoxFit.fill,
          ),
        )
      ],
    ),
  );
}
