import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petapplication/pages/splashscreen.dart';

//import 'package:petapplication/pages/welcome_page1.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
     theme: ThemeData(fontFamily: 'Poppins'),    
      debugShowCheckedModeBanner: false,
      home:const SplashScreen(), // Display the splash screen first
    );
  }
}
