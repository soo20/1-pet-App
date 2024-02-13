import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petapplication/Welcome/presention/widgets/welcombody.dart';
import 'package:petapplication/core/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // AnimationController give me value from 0 to 1
  AnimationController? animationController;
  Animation<double>? fadingAnimation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration:const Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  int backgroundColor = 0xFFBBB2B4; // Color code represented as an integer
  SizeConfig().init(context);
  double aspectRatio = screenHeight/screenWidth; // Set your desired aspect ratio

  return Scaffold(
    backgroundColor: Color(backgroundColor),
    body: Stack(
      children: [
        Positioned(
          top: SizeConfig.defaultSize!*13.5,
          //right: SizeConfig.defaultSize!/10,
          bottom: SizeConfig.defaultSize!*28.5,
          width: 410,
          child: AspectRatio(
            aspectRatio: aspectRatio,
                child: Image.asset(
              'assets/image/Group286.png',
              fit: BoxFit.contain, // Adjust the fit as needed
            ),
         
          ),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize!*21.5, // Adjust the position of the text as per your layout
          left: 0,
          right: 0,
          child: Center(
            child: FadeTransition(
              opacity: fadingAnimation!,
              child: const Text(
                'Hello,', // Replace with your desired text
                style: TextStyle(
                  fontFamily: 'Cosffira', // Use Poppins font
                  fontSize: 59, // Adjust the font size as needed
                  color: Color.fromRGBO(11, 47, 55, 1),
                  fontWeight:
                      FontWeight.bold, // Use FontWeight.bold for bold style
                ),
              ),
            ),
          ),
        ),
         Positioned(
          bottom: SizeConfig.defaultSize!*21.0, // Adjust the position of the text as per your layout
          left: 0,
          right: 0,
          child: const Center(
            child: Text(
              'I\'m Yuna. Ready to explore the world of pets together?', // Replace with your desired text
              style: TextStyle(
                fontFamily: 'Cosffira', // Use Poppins font
                fontSize: 14.5, // Adjust the font size as needed
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

void goToNextView() {
  Future.delayed(const Duration(seconds: 3), () {
    // function doing return to widgets
    Get.to(() => const WelcomeBody(), transition: Transition.fade);
  });
}}