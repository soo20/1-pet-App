import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petapplication/pages/my_pets_pages/pet_profile_page.dart';
import 'package:petapplication/some_files_to_data/today_and_future_reminders_data.dart';

class ScrolledEvents extends StatefulWidget {
  const ScrolledEvents(
      {super.key, eventHeight, required this.petsInformationList});
  final List<FutureEventsInformations> petsInformationList;
  @override
  State<ScrolledEvents> createState() => _ScrolledEvents();
}

late double eventHeight;

class _ScrolledEvents extends State<ScrolledEvents> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // this will be dynamic coloumn that depends on the length of list
          for (FutureEventsInformations i in widget.petsInformationList)
            Container(
              height: size.width * 0.32,
              width: size.width * 0.70,
              margin: EdgeInsets.only(right: size.width * 0.001),
              child: Card(
                color: i.petType == 'Cat'
                    ? const Color(0xffA26874)
                    : const Color(0xffB5C0D0),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0.r),
                  side: BorderSide(
                    color: const Color(0xff707070), // Set the border color
                    width: size.width * 0.001, // Set the border width
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: size.width * 0.016,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            i.eventTitle,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.justify,
                            i.eventDate,
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: size.width * 0.048,
                              fontWeight: FontWeight.w100,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.090,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              minimumSize: WidgetStatePropertyAll(Size(
                                  size.width * 0.0157, size.height * 0.045)),
                              textStyle: WidgetStatePropertyAll(
                                TextStyle(
                                  fontFamily: 'Cosffira',
                                  fontSize: size.width * 0.039,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              foregroundColor: const WidgetStatePropertyAll(
                                Color(0xff4A5E7C),
                              ),
                              backgroundColor: const WidgetStatePropertyAll(
                                Color.fromARGB(255, 248, 241, 227),
                              ),
                            ),
                            onPressed: () {
                              Get.to(PetProfilePage(petInformation: i.pet),
                                  transition: Transition.fadeIn);
                            },
                            child: Text(i.petName),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: i.eventTitle.length <= 13
                                ? size.width * 0.04
                                : 0.0),
                        child: Image(
                          image: AssetImage(i.imageUrl),
                          width: i.eventTitle == 'Medical Checkup'
                              ? size.width * 0.24
                              : size.width * 0.324,
                          height: size.height * 0.135,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
