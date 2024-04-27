import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';
import 'package:petapplication/pages/my_pets_pages/pet_profile_page.dart';

class DiseasesInformationForPet extends StatefulWidget {
  const DiseasesInformationForPet({
    super.key,
    required this.poopDetectionResult,
    required this.skinDetectionResult,
  });
  final String poopDetectionResult;
  final String skinDetectionResult;
  @override
  State<DiseasesInformationForPet> createState() =>
      _DiseasesInformationForPetState();
}

class _DiseasesInformationForPetState extends State<DiseasesInformationForPet> {
  get petInformation => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      //to custom the navigation distination that i want
      onPopInvoked: (bool c) => Navigator.pushNamed(context, 'home'),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: const Color(0xffEFE7E7),
        body: Container(
          color: const Color(0xffEFE7E7),
          child: (widget.poopDetectionResult.isEmpty &&
                  widget.skinDetectionResult.isEmpty)
              ? Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.09,
                            bottom: size.height * 0.08),
                        child: Image.asset(
                          'assets/image/diseses_information_for_pet_images/Gizmo_when_not_detection.png',
                          height: size.height * 0.54751,
                          width: size.width * 0.82484,
                          fit: BoxFit.fill,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Get.to();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffA26874),
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.028,
                            vertical: size.height * 0.025,
                          ), // Adjust the padding as needed
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              size.width * 0.032,
                            ), // Set the border radius of the button
                          ),
                        ),
                        label: Padding(
                          padding: EdgeInsets.only(
                            // left: size.width * 0.07,
                            right: size.width * 0.03,
                          ),
                          child: Text(
                            'Detect Now',
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
                        icon: Icon(
                          Icons.arrow_right_alt_rounded,
                          color: const Color(0xffffffff),
                          weight: size.width * 0.5,
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                  children: [
                    if (widget.skinDetectionResult.isNotEmpty)
                      Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          widget.skinDetectionResult != 'healthy'
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
                                ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          widget.skinDetectionResult != 'healthy'
                              ? Text(
                                  'your pet is suffering from:',
                                  style: TextStyle(
                                    height: 0.0,
                                    fontFamily: 'Cosffira',
                                    fontSize: size.width * 0.045,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(80, 74, 94, 124),
                                  ),
                                )
                              : Text(
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
                          widget.skinDetectionResult != 'healthy'
                              ? Text(
                                  widget.skinDetectionResult,
                                  style: TextStyle(
                                    fontFamily: 'Cosffira',
                                    fontSize: size.width * 0.075,
                                    fontWeight: FontWeight.w900,
                                    color:
                                        const Color.fromARGB(255, 74, 94, 124),
                                    letterSpacing: 0.5,
                                  ),
                                )
                              : Text(
                                  'Your pet has healthy skin.',
                                  style: TextStyle(
                                    height: 0.0,
                                    fontFamily: 'Cosffira',
                                    fontSize: size.width * 0.057,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff4A5E7C),
                                  ),
                                ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Get.to(

                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffA26874),
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.028,
                                vertical: size.height * 0.025,
                              ), // Adjust the padding as needed
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  size.width * 0.038,
                                ), // Set the border radius of the button
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.13,
                                right: size.width * 0.13,
                              ),
                              child: Text(
                                'About',
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
                    if (widget.poopDetectionResult.isEmpty)
                      Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          widget.poopDetectionResult == 'healthy'
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
                          widget.poopDetectionResult != 'healthy'
                              ? Text(
                                  'your pet is suffering from:',
                                  style: TextStyle(
                                    height: 0.0,
                                    fontFamily: 'Cosffira',
                                    fontSize: size.width * 0.045,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(80, 74, 94, 124),
                                  ),
                                )
                              : Text(
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
                          widget.poopDetectionResult != 'healthy'
                              ? Text(
                                  widget.poopDetectionResult,
                                  style: TextStyle(
                                    fontFamily: 'Cosffira',
                                    fontSize: size.width * 0.075,
                                    fontWeight: FontWeight.w900,
                                    color:
                                        const Color.fromARGB(255, 74, 94, 124),
                                    letterSpacing: 0.5,
                                  ),
                                )
                              : Text(
                                  'Your pet has healthy skin.',
                                  style: TextStyle(
                                    height: 0.0,
                                    fontFamily: 'Cosffira',
                                    fontSize: size.width * 0.057,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff4A5E7C),
                                  ),
                                ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Get.to(

                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4A5E7C),
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.028,
                                vertical: size.height * 0.025,
                              ), // Adjust the padding as needed
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  size.width * 0.038,
                                ), // Set the border radius of the button
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.13,
                                right: size.width * 0.13,
                              ),
                              child: Text(
                                'About',
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
                  ],
                )),
        ),
      )),
    );
  }
}
