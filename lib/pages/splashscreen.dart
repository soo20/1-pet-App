import 'package:flutter/material.dart';
import 'package:petapplication/Welcome/presention/welcome_page1.dart';
import 'package:get/get.dart';
import 'package:petapplication/core/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    //goToNextView();
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
          top: SizeConfig.defaultSize!*20,
          right: SizeConfig.defaultSize!/12,
          bottom: 220,
          width: 400,
          child: AspectRatio(
            aspectRatio: aspectRatio,
                child: Image.asset(
              'assets/image/Group286.png',
              fit: BoxFit.contain, // Adjust the fit as needed
            ),
         
          ),
        ),
        Positioned(
          top: 490, // Adjust the position of the text as per your layout
          left: 0,
          right: 0,
          child: Center(
            child: FadeTransition(
              opacity: fadingAnimation!,
              child: const Text(
                'Hello,', // Replace with your desired text
                style: TextStyle(
                  fontFamily: 'poppins', // Use Poppins font
                  fontSize: 49, // Adjust the font size as needed
                  color: Color.fromRGBO(11, 47, 55, 1),
                  fontWeight:
                      FontWeight.bold, // Use FontWeight.bold for bold style
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          top: 555, // Adjust the position of the text as per your layout
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'I\'m Yuna. Ready to explore the world of pets together?', // Replace with your desired text
              style: TextStyle(
                fontFamily: 'Poppins', // Use Poppins font
                fontSize: 13.3, // Adjust the font size as needed
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

/*void goToNextView() {
  Future.delayed(Duration(seconds: 3), () {
    // function doing return to widgets
    Get.to(() => const WelcomePage(), transition: Transition.fade);
  });
}*/}