import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petapplication/pages/diseases_detection_pages/about_information_page.dart';
import 'package:petapplication/pages/diseases_detection_pages/prevention_information_page.dart';
import 'package:petapplication/pages/diseases_detection_pages/symptoms_information_page.dart';

import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';
import 'package:petapplication/pages/diseases_detection_pages/treatment_information_page.dart';
import 'package:petapplication/pages/my_pets_pages/diseases_information_page.dart';
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
    bool petIsSelected = false;
    int selectedIndex = -1; // Keep track of the index of the selected pet

    choosePetToAddThisDetectionFor(
        List<PetsInformation> dogsInfo, detectionResult) {
      dogsInfo = dogsInformationList;
      bool isThere = false;
      return showDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            elevation: 0.0,
            backgroundColor: const Color(0xffDCD3D3),
            content: SizedBox(
              width: size.width * 0.336,
              height: size.height * 0.315,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Choose Your Pet To Add Detection Result For.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 0.0,
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.057,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff4A5E7C),
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // this will be dynamic column that depends on the length of list
                        for (int index = 0; index < dogsInfo.length; index++)
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: size.width * 0.316,
                              height: size.height * 0.200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.069656),
                                ),
                                border: Border.all(
                                  color: dogsInfo[index].selected
                                      ? const Color(0xffA26874)
                                      : Colors.transparent,
                                ),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // Update the detection result for the selected pet

                                        for (var pet in dogsInfo) {
                                          pet.selected = false;
                                        }
                                        // Set the selected pet
                                        dogsInfo[index].selected = true;
                                        petIsSelected = true;
                                        selectedIndex = index;
                                        isThere = true;
                                      });
                                    },
                                    icon: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          size.width * 0.069656,
                                        ),
                                      ),
                                      child: Image.asset(
                                        dogsInfo[index].imageUrl,
                                        width: size.width * 0.29656,
                                        height: size.height * 0.13656,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    dogsInfo[index].petName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 0.0,
                                      fontFamily: 'Cosffira',
                                      fontSize: size.width * 0.047,
                                      fontWeight: FontWeight.w800,
                                      color: dogsInfo[index].selected
                                          ? const Color(0xffA26874)
                                          : const Color.fromARGB(
                                              99, 74, 94, 124),
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (isThere) {
                      setState(() {
                        if (widget.detectionType) {
                          dogsInfo[selectedIndex].skinDiseaseType =
                              widget.detectionResult;
                        } else {
                          dogsInfo[selectedIndex].poopDiseaseType =
                              widget.detectionResult;
                        }
                      });
                      Get.to(
                        () => DiseasesInformationForPet(
                            poopDetectionResult:
                                dogsInfo[selectedIndex].poopDiseaseType,
                            skinDetectionResult:
                                dogsInfo[selectedIndex].skinDiseaseType),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: petIsSelected
                        ? const Color(0xffA26874)
                        : const Color.fromARGB(90, 181, 128, 138),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.015,
                      vertical: size.height * 0.025,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        size.width * 0.092,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.12,
                      right: size.width * 0.12,
                    ),
                    child: Text(
                      'Done',
                      style: TextStyle(
                        height: 0.0,
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w800,
                        color: isThere
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(162, 215, 222, 232),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ).then(
        (value) => setState(
          () {
            for (var pet in dogsInfo) {
              pet.selected = false;
            }
            petIsSelected = false;
          },
        ),
      );
    }

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
                    'Would you like to "save" or "Update" this detection for your pet?',
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
                            onPressed: () async {
                              await choosePetToAddThisDetectionFor(
                                  dogsInformationList, widget.detectionResult);
                              setState(() {});
                            },
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
                        '',
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
