// ignore_for_file: avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
//import 'package:petapplication/pages/splashscreen.dart';
//import 'package:petapplication/pages/splashscreen.dart';

import 'package:petapplication/pages/splashscreen.dart';
// import 'package:petapplication/pages/splashscreen.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const YunaPetApp());
}

class YunaPetApp extends StatelessWidget {
  const YunaPetApp({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print('width :$screenWidth height $screenHeight');
    //A flutter plugin for adapting screen and font size.
    return ScreenUtilInit(
      //The size of the device screen in the design
      designSize: const Size(1080, 1920),
      //support for split screen
      splitScreenMode: true,
      //Whether to adapt the text according to the minimum of width and height
      minTextAdapt: true,
      //Return widget that uses the library in a property (ex: MaterialApp's theme)
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(fontFamily: 'Poppins'),
          debugShowCheckedModeBanner: false,
          home: child,
          initialRoute: 'home',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            'home': (context) => const TheMainHomePage(),
            // When navigating to the "/second" route, build the SecondScreen widget.
          }, // Display the splash screen first
        );
      },
      //A part of builder that its dependencies/properties don't use the library
      child: const SplashScreen()
          //const TheMainHomePage(),
    );
  }
}
