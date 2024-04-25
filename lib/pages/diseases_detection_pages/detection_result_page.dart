import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petapplication/pages/diseases_detection_pages/about_information_page.dart';
import 'package:petapplication/pages/diseases_detection_pages/prevention_information_page.dart';
import 'package:petapplication/pages/diseases_detection_pages/symptoms_information_page.dart';
import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';
import 'package:petapplication/pages/diseases_detection_pages/treatment_information_page.dart';
import 'package:petapplication/pages/my_pets_pages/my_pets.dart';

class DetectionResulrPage extends StatefulWidget {
  const DetectionResulrPage({
    super.key,
    required this.detectionType,
    required this.detectionResult,
  });
  final bool detectionType;
  final String detectionResult;
  @override
  State<DetectionResulrPage> createState() => _DetectionResulrPageState();
}

class _DetectionResulrPageState extends State<DetectionResulrPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    allowingCameraDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) => BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: size.width * 0.01,
                  sigmaY: size.width * 0.01,
                ),
                child: AlertDialog(
                  elevation: 0.0,
                  backgroundColor: const Color(0xffDCD3D3),
                  content: Text(
                    'Would you like to save this detection for your pet?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 0.0,
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.047,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff4A5E7C),
                      letterSpacing: 0.5,
                    ),
                  ),
                  actions: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        // Align buttons at the ends
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffA26874),
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.028,
                                vertical: size.height * 0.025,
                              ), // Adjust the padding as needed
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  size.width * 0.092,
                                ), // Set the border radius of the button
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.23,
                                right: size.width * 0.23,
                              ),
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  height: 0.0,
                                  fontFamily: 'Cosffira',
                                  fontSize: size.width * 0.045,
                                  fontWeight: FontWeight.w800,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(
                                const TheMainHomePage(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffB5C0D0),
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.028,
                                vertical: size.height * 0.025,
                              ), // Adjust the padding as needed
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  size.width * 0.092,
                                ), // Set the border radius of the button
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.2,
                                right: size.width * 0.2,
                              ),
                              child: Text(
                                'Ignore',
                                style: TextStyle(
                                  height: 0.0,
                                  fontFamily: 'Cosffira',
                                  fontSize: size.width * 0.045,
                                  fontWeight: FontWeight.w800,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
    }

    choosePetToAddThisDetectionFor(
        List<PetsInformation> dogsInfo, detectionResult) {
      bool petIsSelected = false;
      dogsInfo = dogsInformationList;
      return AlertDialog(
        elevation: 0.0,
        backgroundColor: const Color(0xffDCD3D3),
        content: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // this will be dynamic coloumn that depends on the length of list
                  for (PetsInformation i in dogsInfo)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red, // Set the color of the border here
                        ),
                        color:
                            Colors.transparent, // Set background to transparent
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            i.imageUrl,
                          ),
                          Text(
                            'Choose Your Per To Add Detection Result For.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 0.0,
                              fontFamily: 'Cosffira',
                              fontSize: size.width * 0.047,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xff4A5E7C),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            Text(
              'Choose Your Per To Add Detection Result For.',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 0.0,
                fontFamily: 'Cosffira',
                fontSize: size.width * 0.047,
                fontWeight: FontWeight.w800,
                color: const Color(0xff4A5E7C),
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: petIsSelected
                    ? const Color(0xffA26874)
                    : const Color(0xffA26874),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.028,
                  vertical: size.height * 0.025,
                ), // Adjust the padding as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    size.width * 0.092,
                  ), // Set the border radius of the button
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.23,
                  right: size.width * 0.23,
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffEFE7E7),
          leading: IconButton(
            onPressed: () {
              allowingCameraDialog();
            },
            icon: Image.asset(
              'assets/icons/diseases_datection_result_page_icons/exit_icon.png',
              width: size.width * 0.075,
              height: size.height * 0.075,
            ),
          ),
        ),
        body: Container(
          color: const Color(0xffEFE7E7),
          child: Center(
            child: widget.detectionResult != 'healthy'
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/image/disease_detection_result_page_images/ill_animals.png',
                        width: size.width * 0.47667,
                        height: size.height * 0.1899,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'your pet is suffering from:',
                        style: TextStyle(
                          height: 0.0,
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(80, 74, 94, 124),
                        ),
                      ),
                      Text(
                        widget.detectionResult,
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.075,
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(255, 74, 94, 124),
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                padding: EdgeInsets.all(
                                  size.width * 0.01,
                                ),
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  Get.to(
                                    SymptomsInformationPage(
                                      detectionType: widget.detectionType,
                                      detectionResult: widget.detectionResult,
                                    ),
                                    transition: Transition.fade,
                                  );
                                },
                                icon: Image.asset(
                                  'assets/icons/diseases_datection_result_page_icons/symptoms_icon.png',
                                  width: size.width * 0.374,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              IconButton(
                                padding: const EdgeInsets.all(0.0),
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  Get.to(
                                    TreatmentInformationPage(
                                      detectionType: widget.detectionType,
                                      detectionResult: widget.detectionResult,
                                    ),
                                    transition: Transition.fade,
                                  );
                                },
                                icon: Image.asset(
                                  'assets/icons/diseases_datection_result_page_icons/treatment_icon.png',
                                  width: size.width * 0.384,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                padding: EdgeInsets.all(
                                  size.width * 0.01,
                                ),
                                alignment: Alignment.centerLeft,
                                onPressed: () {
                                  Get.to(
                                    AboutInformationPage(
                                      detectionType: widget.detectionType,
                                      detectionResult: widget.detectionResult,
                                    ),
                                    transition: Transition.fade,
                                  );
                                },
                                icon: Image.asset(
                                  'assets/icons/diseases_datection_result_page_icons/about_icon.png',
                                  width: size.width * 0.384,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              IconButton(
                                padding: const EdgeInsets.all(0.0),
                                alignment: Alignment.centerLeft,
                                onPressed: () {
                                  Get.to(
                                    PreventionInformationPage(
                                      detectionType: widget.detectionType,
                                      detectionResult: widget.detectionResult,
                                    ),
                                    transition: Transition.fade,
                                  );
                                },
                                icon: Image.asset(
                                  'assets/icons/diseases_datection_result_page_icons/prevention_icon.png',
                                  width: size.width * 0.374,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Image.asset(
                        'assets/image/disease_detection_result_page_images/celebration_image.png',
                        width: size.width * 0.33316,
                        height: size.height * 0.19923,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'Congratulations!',
                        style: TextStyle(
                          height: 0.0,
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.112,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xffA26874),
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'Your pet has healthy skin.',
                        style: TextStyle(
                          height: 0.0,
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.057,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4A5E7C),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
