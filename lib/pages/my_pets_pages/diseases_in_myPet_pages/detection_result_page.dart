import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petapplication/pages/my_pets_pages/diseases_in_myPet_pages/about_information_in_myPet.dart';
import 'package:petapplication/pages/my_pets_pages/diseases_in_myPet_pages/prevention_information_in_myPet.dart';
import 'package:petapplication/pages/my_pets_pages/diseases_in_myPet_pages/symptoms_information_in_myPet.dart';

import 'package:petapplication/pages/my_pets_pages/diseases_in_myPet_pages/treatment_information_page_in_myPet.dart';

class DetectionResulrPage extends StatefulWidget {
  const DetectionResulrPage({
    super.key,
    required this.detectionType,
    required this.petId,
    required this.detectionResult,
  });
  final bool detectionType;
  final String petId;
  final String detectionResult;

  @override
  State<DetectionResulrPage> createState() => _DetectionResulrPageState();
}

class _DetectionResulrPageState extends State<DetectionResulrPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffEFE7E7),
      body: Container(
        height: size.height,
        color: const Color(0xffEFE7E7),
        child: Center(
          child: widget.detectionResult == 'null'
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Image.asset(
                      'assets/image/pet_profile_page_images/OopsDog.png',
                      width: size.width * 0.33316,
                      height: size.height * 0.19923,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Oops!',
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
                      "You didn't save eny Diseases detection Yet ",
                      style: TextStyle(
                        height: 0.0,
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.057,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff4A5E7C),
                      ),
                    ),
                  ],
                )
              : widget.detectionResult != 'healthy'
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.detectionType
                            ? widget.detectionResult != 'healthy'
                                ? Image.asset(
                                    'assets/image/disease_detection_result_page_images/ill_animals.png',
                                    width: size.width * 0.47667,
                                    height: size.height * 0.1899,
                                    fit: BoxFit.fill,
                                  )
                                : Image.asset(
                                    'assets/image/disease_detection_result_page_images/celebration_image.png',
                                    width: size.width * 0.33316,
                                    height: size.height * 0.19923,
                                  )
                            : widget.detectionResult != 'Normal'
                                ? Image.asset(
                                    'assets/icons/diseses_information_for_pet_icons/ill_poop.png',
                                    width: size.width * 0.29667,
                                    height: size.height * 0.1599,
                                    fit: BoxFit.fill,
                                  )
                                : Image.asset(
                                    'assets/icons/diseses_information_for_pet_icons/haelthy_poop.png',
                                    width: size.width * 0.33316,
                                    height: size.height * 0.19923,
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
                            fontSize: size.width * 0.055,
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
                                        detectionResult:
                                            widget.detectionResult.toString(),
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
    ));
  }
}
