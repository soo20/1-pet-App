import 'package:flutter/material.dart';

class ChooseDetectionType extends StatelessWidget {
  const ChooseDetectionType({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    color: const Color.fromARGB(129, 42, 96, 108)),
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
                  onPressed: () {},
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
                  onPressed: () {},
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
