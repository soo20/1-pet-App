import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petapplication/Welcome/presention/widgets/welcombody.dart';
import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';

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
    int backgroundColor = 0xFFB5C0D0;
    // Color code represented as an integer
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: Center(
        child: Column(
          /*In order not to make the column take up all the available
           space on the screen, you must make it take the minimum space,
            which is the appropriate space for the column’s content.*/
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/image/Group286.png',
              //set the width of image
              width: 700.w,
            ),

            //you have two different text styles, so we make two text widgets.
            Padding(
              /*We put it in the padding widget because we don't want any
               height but want space between the image and the text.*/
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                // we put the text string.
                'Hello,',
                //to style your text:
                style: TextStyle(
                  //to make adaptive font size we call 'h' function:
                  height: 2.h,
                  //to customize your font.
                  fontFamily: 'Cosffira',
                  //to make adaptive font size we call 'sp' function.
                  fontSize: 150.sp,
                  color: const Color(0xff19283F),
                  //to make your font bold or normal "regular".
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              // we put the text string.
              'I\'m Yuna. Ready to explore the world of pets together?',
              //to style your text:
              style: TextStyle(
                fontFamily: 'Cosffira',
                //to make adaptive font size we call 'sp' function.
                fontSize: 42.sp,
                color: const Color.fromARGB(255, 0, 0, 0),
                //to make your font normal "regular" or bold.
                fontWeight: FontWeight.normal,
              ),
              /*The content of the text was large, 
                so it was moved to the front when displaying,
                and to make it in the center, I put this argument*/
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to WelcomeBody and remove SplashScreen from the stack
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Get.off(() => const WelcomeBody(), transition: Transition.fade);
      } else {
        Get.off(() => const TheMainHomePage(), transition: Transition.fade);
      }
    });
  }
}
