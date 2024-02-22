import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petapplication/Welcome/presention/widgets/welcombody.dart';

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
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
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
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/image/Group286.png',
              width: 694.w,
              //height: 808.48.h,
              // Adjust the fit as needed
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Hello,', // Replace with your desired text
                style: TextStyle(
                  height: 2.h,
                  fontFamily: 'Cosffira', // Use Poppins font
                  fontSize: 147.sp, // Adjust the font size as needed
                  color: const Color.fromRGBO(11, 47, 55, 1),
                  fontWeight: FontWeight.bold,
                  // Use FontWeight.bold for bold style
                ),
              ),
            ),
            Text(
              'I\'m Yuna. Ready to explore the world of pets together?', // Replace with your desired text
              style: TextStyle(
                fontFamily: 'Cosffira', // Use Cosffira font
                fontSize: 40.sp, // Adjust the font size as needed
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      // function doing return to widgets
      Get.to(() => const WelcomeBody(), transition: Transition.fade);
    });
  }
}
