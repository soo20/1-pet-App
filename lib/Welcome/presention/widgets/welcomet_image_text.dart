// ignore_for_file: unused_import, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:petapplication/Welcome/presention/widgets/Component1311.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/page1/widgets/alart_dialog.dart';
import 'package:petapplication/pages/page2/popup_surface.dart';

//import 'package:google_fonts/google_fonts.dart';
class TextOverImageItem1 extends StatelessWidget {
  const TextOverImageItem1({super.key, this.image1, this.image2});
  final String? image1;
  final String? image2;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
   


    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    return Container(
      color: kMainColorPage,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: aspectRatio,
          ),
          Positioned(
            
            top: 120,
            left: -40,
            bottom: 70,
            width: 300,
            child: Padding(
              padding:
                  const EdgeInsets.all(16.0), // Add padding of 8.0 to all sides
              child: Image.asset(
                image1!,
                
                //'assets/image/Group315.png',
                width: 180, // Set the width of the image
                height: 280, // Set the height of the image
                fit: BoxFit.contain, // Adjust the fit as needed
              ),
            ),
          ),
          Stack(
            
            alignment: Alignment.topLeft,
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
              ),
              Positioned(
                
               right:
                    15, // Set the left position to 0 to align with the left edge
                top:
                    90, // Set the top position to 0 to align with the top edge
                child: SvgPicture.asset(
                  image2!,
                  //'asse/icons/k1.svg', // Replace with your image asset
                  width:540, // Set the width of the image
                  height: 225, // Set the height of the image
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
              
             
            ],
          ),
        ],
      ),
    );
  }
}

class TextOverImageItem2 extends StatelessWidget {
  const TextOverImageItem2({super.key});

  @override
  Widget build(BuildContext context) {
    

    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate height based on a 16:9 aspect ratio
    double itemWidth = screenWidth - 70; // Adjust the width as needed
    double itemHeight = itemWidth / 16 * 9;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Container(
        color: kMainColorPage,
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: -200,
              bottom: 40,
              width: itemWidth,
              child: Padding(
                padding: const EdgeInsets.all(105.0),
                child: Image.asset(
                  'assets/image/Group327.png',
                  width: itemWidth,
                  height: itemHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ),
             const Stack(
              alignment: Alignment.topLeft,
              children: [
                Component1314(),
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
            ),
          ],
          
        ),
      ),
    );
  }
}

class TextOverImageItem3 extends StatelessWidget {
   const TextOverImageItem3({super.key});
   // Set your desired aspect ratio

  @override
  Widget build(BuildContext context) {
  

    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Container(
        color: kMainColorPage,
        child: Stack(
          children: [
            Positioned(
              top: 160,
              right: -20 ,
              bottom: 90,
              width: screenWidth / 4.5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/image/Group737.png',
                  width: screenWidth / 1.55, // Adjust the width
                  height: screenHeight * 0.1, // Adjust the height as needed
                  fit: BoxFit.contain,
                ),
              ),
            ),
            /*Stack(
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
              ],
            )*/
          ],
        ),
      ),
    );
  
  }}


class TextOverImageItem4 extends StatelessWidget {
  const TextOverImageItem4({super.key});

  @override
  Widget build(BuildContext context) {
   

    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate dimensions based on a 16:9 aspect ratio
    double itemWidth = screenWidth - 420; // Adjust this value as needed
    double itemHeight = itemWidth / 16 * 9;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Container(
        color: kMainColorPage,
        child: Stack(
          children: [
            Positioned(
              top: 170,
              right: -177,
              bottom: -45,
              width: itemWidth,
              child: Padding(
                padding: const EdgeInsets.all(165.0),
                child: Image.asset(
                  'assets/image/monkey.png',
                  width: itemWidth,
                  height: itemHeight,
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
            ),
          ],
        ),
      ),
    );
  }
}


class TextOverSVGImage6 extends StatelessWidget {
  const TextOverSVGImage6({super.key});

  @override
  Widget build(BuildContext context) {


    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate dimensions based on a 16:9 aspect ratio
    double itemWidth = screenWidth - 220; // Adjust this value as needed
    double itemHeight = itemWidth / 16 * 9;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Container(
        color: kMainColorPage,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 164,
             right: -166,
              bottom: 20,
              width: itemWidth,
              child: Padding(
                padding: const EdgeInsets.all(90.0),
                child: Image.asset(
                  'assets/image/Group766.png',
                  width: itemWidth,
                  height: itemHeight,
                  fit: BoxFit.contain,
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
            ),
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


    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate dimensions based on a 16:9 aspect ratio
    double itemWidth = screenWidth - 220; // Adjust this value as needed
    double itemHeight = itemWidth / 16 * 9;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Container(
        color: kMainColorPage,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 164,
             right: -150,
              bottom: 20,
              width: itemWidth,
              child: Padding(
                padding: const EdgeInsets.all(90.0),
                child: Image.asset(
                  'assets/image/Group1021.png',
                  width: itemWidth,
                  height: itemHeight,
                  fit: BoxFit.contain,
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
            ),
          ],
        ),
      ),
    );
  }
}

class JackDefineText extends StatelessWidget {
  const JackDefineText({super.key});

  @override
  Widget build(BuildContext context) {
    

    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate height based on a 16:9 aspect ratio
    double itemWidth = screenWidth - 70; // Adjust the width as needed
    double itemHeight = itemWidth / 16 * 9;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Stack(
        children: [
          Positioned(
            top: 90,
            left: -250,
            bottom: 10,
            width: itemWidth,
            child: Padding(
              padding: const EdgeInsets.all(90.0),
              child: Image.asset(
                'assets/image/Group1340.png',
                width: itemWidth,
                height: itemHeight,
                fit: BoxFit.contain,
              ),
            ),
          ),
            Stack(
            alignment: Alignment.topLeft,
            children: [
             const  Component1315(),
              Positioned(
                right: 140,
                left: SizeConfig.defaultSize! * 15.5,
                bottom: SizeConfig.defaultSize! * 6,
                child:  CustomGeneralButtom3(
                  text: '', boxColor: kMainColor,  height: 58, textColor: null,
                  onTap: () {
                     showDialog(
            context: context,
            builder: (context) =>  const AlartDialogPage()
          );
        },
                ),
              ),
              // Other widgets can be added here within the Stack if needed
            ],
          ),
        ],
        
      ),
    );
  }
}



// ignore: unused_element
const String _svg_wadptu =
    '<svg viewBox="6.0 0.0 221.0 37.0" ><path transform="translate(-628.34, 3069.19)" d="M 634.3417358398438 -3032.1884765625 L 640.6785888671875 -3069.1884765625 L 659.6895141601562 -3046.848876953125 L 824.4493408203125 -3046.848876953125 L 844.2520751953125 -3069.1884765625 L 855.3417358398438 -3032.1884765625" fill="none" stroke="#081e17" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
