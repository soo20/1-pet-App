// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:petapplication/Welcome/presention/widgets/Component1311.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

//import 'package:google_fonts/google_fonts.dart';
class TextOverImageItem1 extends StatelessWidget {
  const TextOverImageItem1({Key? key, this.image1, this.image2})
      : super(key: key);
  final String? image1;
  final String? image2;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9, // Set your desired aspect ratio here
      child: Container(
      color: kMainColorPage,
      child: Stack(
        children: [
          Positioned(
            top: 120,
            left: -25,
            bottom: 90,
            width: 300,
            child: Padding(
              padding:
                  const EdgeInsets.all(8.0), // Add padding of 8.0 to all sides
              child: Image.asset(
                image1!,
                //'assets/image/Group315.png',
                width: 300, // Set the width of the image
                height: 300, // Set the height of the image
                fit: BoxFit.contain, // Adjust the fit as needed
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                right:
                    15, // Set the left position to 0 to align with the left edge
                top:
                    130, // Set the top position to 0 to align with the top edge
                child: SvgPicture.asset(
                  image2!,
                  //'assets/icons/k1.svg', // Replace with your image asset
                  width: 0, // Set the width of the image
                  height: 245, // Set the height of the image
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
              /*Positioned(
                  right: 33,
                  left: SizeConfig.defaultSize! * 28,
                  bottom: SizeConfig.defaultSize! * 6,
                  child: const CustomGeneralButtom(
                    text: 'Lets meet',
                    svgPath:
                        'assets/icons/Group312.svg', // Replace with your SVG asset path
                  ),
                ),*/
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextOverImageItem2 extends StatelessWidget {
  const TextOverImageItem2({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9, // Set your desired aspect ratio here
      child: Container(
      color: kMainColorPage,
      child: Stack(
        children: [
          Positioned(
            top: 100,
            right: -35,
            bottom: 90,
            width: 290,
            child: Padding(
              padding:
                  const EdgeInsets.all(16.0), // Add padding of 8.0 to all sides
              child: Image.asset(
                'assets/image/Group327.png',
                width: 155,
                height: 55,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                left: 7,
                top: 170,
                child: SvgPicture.asset(
                  'assets/icons/Group.svg',
                  width: 250,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              /*Stack(
                alignment: Alignment.topLeft,
                children: [
                  Positioned(
                    right: 33,
                    left: SizeConfig.defaultSize! * 28,
                    bottom: SizeConfig.defaultSize! * 6,
                    child: const CustomGeneralButtom(
                      text: 'continue',
                    ),
                  ),
                  // Other widgets can be added here within the Stack if needed
                  ),
                ),*/
              ],
            )
          ],
        ),
      ),
    );
  }
}


class TextOverImageItem3 extends StatelessWidget {
  const TextOverImageItem3({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9, // Set your desired aspect ratio here
      child:  Container(
      color: kMainColorPage,
      child: Stack(
        children: [
          Positioned(
            top: 100,
            right: -35,
            bottom: 90,
            width: 290,
            child: Padding(
              padding:
                  const EdgeInsets.all(16.0), // Add padding of 8.0 to all sides
              child: Image.asset(
                'assets/image/Group737.png',
                width: 55,
                height: 55,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                left: 7,
                top: 170,
                child: SvgPicture.asset(
                  'assets/icons/Group742.svg',
                  width: 300,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              /*Stack(
                alignment: Alignment.topLeft,
                children: [
                  Positioned(
                    right: 33,
                    left: SizeConfig.defaultSize! * 28,
                    bottom: SizeConfig.defaultSize! * 6,
                    child: const CustomGeneralButtom(
                      text: 'continue',
                    ),
                  ),
                  // Other widgets can be added here within the Stack if needed
                   ),
                ),*/
              ],
            )
          ],
        ),
      ),
    );
  }
}


class TextOverImageItem4 extends StatelessWidget {
  const TextOverImageItem4({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9, // Set your desired aspect ratio here
      child: Container(
      color: kMainColorPage,
      child: Stack(
        children: [
          Positioned(
            top: 210,
            right: -177,
            bottom: 0,
            width: 666,
            child: Padding(
              padding: const EdgeInsets.all(
                  170.0), // Add padding of 8.0 to all sides
              child: Image.asset(
                'assets/image/monkey.png',
                width: 00,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Stack(
            alignment: Alignment.topLeft,
            children: [
               Component1311(),
              /*Positioned(
                right: 33,
                left: SizeConfig.defaultSize! * 28,
                bottom: SizeConfig.defaultSize! * 6,
                child: const CustomGeneralButtom(
                  text: 'continue',
                ),
              ),*/
              // Other widgets can be added here within the Stack if needed
                    ],
            )
          ],
        ),
      ),
    );
  }
}

class TextOverSVGImage5 extends StatelessWidget {
  const TextOverSVGImage5({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9, // Set your desired aspect ratio here
      child:  Container(
      color: kMainColorPage,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 174,
            left: -120,
            bottom: 20,
            width: 560,
            child: Padding(
              padding: const EdgeInsets.all(
                  115.0), // Add padding of 8.0 to all sides
              child: Image.asset(
                'assets/image/Group766.png',
                width: 00,
                height: 00,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Stack(
            alignment: Alignment.topLeft,
            children: [
              Component1312(),
              /*Positioned(
                right: 33,
                left: SizeConfig.defaultSize! * 28,
                bottom: SizeConfig.defaultSize! * 6,
                child: const CustomGeneralButtom(
                  text: 'continue',
                ),
              ),*/
              // Other widgets can be added here within the Stack if needed
                    ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: unused_element
const String _svg_wadptu =
    '<svg viewBox="6.0 0.0 221.0 37.0" ><path transform="translate(-628.34, 3069.19)" d="M 634.3417358398438 -3032.1884765625 L 640.6785888671875 -3069.1884765625 L 659.6895141601562 -3046.848876953125 L 824.4493408203125 -3046.848876953125 L 844.2520751953125 -3069.1884765625 L 855.3417358398438 -3032.1884765625" fill="none" stroke="#081e17" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
