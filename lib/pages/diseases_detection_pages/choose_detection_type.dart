import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petapplication/pages/diseases_detection_pages/diseases_dtection_camera.dart';

class ChooseDetectionType extends StatelessWidget {
  const ChooseDetectionType({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    allowingCameraDialog({required bool detectionType}) {
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
                  content: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      style: TextStyle(
                        height: 0.0,
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.047,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff4A5E7C),
                        letterSpacing: 0.5,
                      ),
                      children: const [
                        TextSpan(
                            text: 'Allow',
                            style: TextStyle(fontWeight: FontWeight.w400)),
                        TextSpan(
                          text: ' "yuna app" ',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                            text: 'to access\nyour camera on this device"',
                            style: TextStyle(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  actions: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        // Align buttons at the ends
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.to(
                                  () => DiseasesDetectionCamera(
                                        detectionType: detectionType,
                                      ),
                                  transition: Transition.native);
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
                                left: size.width * 0.06,
                                right: size.width * 0.06,
                              ),
                              child: Text(
                                'while using this app',
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
                              Navigator.of(context).pop();
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
                                'Cancel',
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

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/image/diseases_detection_page_images/diseases_page_background.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height > 707.4285714285714
                  ? size.height * 0.07
                  : size.height * 0.05,
            ),
            Image.asset(
              "assets/image/diseases_detection_page_images/centered_image_for_diseases_detection.png",
              width: size.width * 0.640,
              height: size.height * 0.313,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.04,
                bottom: size.height * 0.01,
              ),
              child: Text(
                'Choose Detect Type:',
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: size.width * 0.050,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: const Color(0xff9A9EAC),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      const Color.fromARGB(255, 249, 249, 249),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color?>(
                      const Color(0xffEBBBBB),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle?>(
                      TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.059,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.5,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius here
                      ),
                    ),
                    elevation: MaterialStateProperty.all<double>(
                      size.width * 0.01,
                    ),
                  ),
                  onPressed: () {
                    allowingCameraDialog(detectionType: true);
                  },
                  icon: Image.asset(
                    "assets/icons/diseases_detection_page_icons/skin_icon.png",
                    width: size.width * 0.07387,
                    height: size.height * 0.06838,
                  ),
                  label: // Adjust the padding to control button width
                      const Text('Skin'),
                ),
                SizedBox(
                  width: size.height * 0.01838,
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color?>(
                        const Color(0xffEBBBBB),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color?>(
                        const Color(0xffF3F2F2),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle?>(
                        TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.059,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust the border radius here
                        ),
                      ),
                      elevation:
                          MaterialStateProperty.all<double>(size.width * 0.01)),
                  onPressed: () {
                    allowingCameraDialog(detectionType: true);
                  },
                  icon: Image.asset(
                    "assets/icons/diseases_detection_page_icons/boob_icon.png",
                    width: size.width * 0.07387,
                    height: size.height * 0.06838,
                  ),
                  label: const Text('Boob'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
