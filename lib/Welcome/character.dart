

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';

import 'package:petapplication/pages/sign_login_acount/logintext.dart';

class Yyuna extends StatelessWidget {
  const Yyuna({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Add space to the left
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
    padding: const EdgeInsets.fromLTRB(
        0.0, 50, 0, 20), // Add padding of 8.0 to all sides
    child: Image.asset(
      'assets/image/Group315.png',
      width: 610.w,
      height: 970.h,
      fit: BoxFit.contain, // Adjust the fit as needed
    ),
        ),// Add space to the top
    
          Center(
            child: Text(
              overflow: TextOverflow.ellipsis,
              'Meet Yuna',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 105.sp,
                color: const Color(0xff74454E),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              overflow: TextOverflow.ellipsis,
              'Unlock a world of pet love with\nMe and my Friends:Connect,share, and\n Enhance your furry friend  life,are you\'s\nReady to meet my Friends? \n',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 45.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.bold,
                height: 1.1
              ),
              textAlign: TextAlign.center,
            ),
          ),
         
          
        ],
      ),
    );
  }
}

class Jjack extends StatelessWidget {
  const Jjack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          // Add space to the left
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 15),
                child: Image.asset(
                  'assets/image/Group327.png',
                  width: 530.w,
                  height: 980.h,
                  fit: BoxFit.fill, // Adjust the fit as needed
                ),
              ),
               Center(
            child: Text(
              overflow: TextOverflow.ellipsis,
              'Meet Jack',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 105.sp,
                color: const Color(0xff74454E),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
               // Add space to the top
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Hi, I\'m Jack.',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 47.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            ' in our app recognizes your pet \nfrom their photo and provides key\ninformation. Welcome to a world where\nyour pet shines!',
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 45.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          height: 1.1
                        ),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                  
                ),
              ),
              
              
            ],
          ),
        ),
        
      ],
    );
  }
}

class Ggizmo extends StatelessWidget {
  const Ggizmo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          // Add space to the left
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
        padding: const EdgeInsets.fromLTRB(
            0.0, 110, 0, 20), // Add padding of 8.0 to all sides
        child: Image.asset(
          'assets/image/Group737.png',
          width: 615.w,
          height: 720.h,
          fit: BoxFit.contain, // Adjust the fit as needed
        ),
                ),
                    Center(
            child: Text(
              overflow: TextOverflow.ellipsis,
              'Meet Gizmo',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 105.sp,
                color: const Color(0xff74454E),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Hey pet pals! Gizmo here',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 45.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            ' Our app now\ndetects skin and fecal issues for your\nfurry buddies. It\'s like a health \nsuperhero in your pocket! ',
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 45.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 1.2
                        ),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
             
            ],
          ),
        ),
        
      ],
    );
  }
}

class Wwanda extends StatelessWidget {
  const Wwanda({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          // Add space to the left
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Padding(
          padding: const EdgeInsets.fromLTRB(
              0.0, 110, 00, 0), // Add padding of 8.0 to all sides
          child: Image.asset(
            'assets/image/Group1021.png',
            width: 430.w,
            height: 765.h,
            fit: BoxFit.fill, // Adjust the fit as needed
          ),
        ),
                            Center(
            child: Text(
              overflow: TextOverflow.ellipsis,
              'Meet Wanda',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 105.sp,
                color: const Color(0xff74454E),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ), // Add space to the top
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Hey pet lovers! Wanda here',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 45.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            ' with exciting\nnews—our app now has a reminder system!\nEnjoy timely pet care prompts and manage\nimportant dates, Join Us on this Convenient,\njourney!',
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 45.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          height: 1.1
                        ),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(right: 35,top: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 70.w,
                    ),
                    CustomGeneralButtom(
                      text: 'Finish',
                      boxColor: const Color(0xff74454E),
                      fontWeight: FontWeight.w600,
                      customFontSize: 40.sp,
                      borderColor: const Color(0xff707070),
                      onTap: () {
                        Get.off(
                          () =>
                              const LoginText(), // Replace YourNextPage with the actual class for the next page
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      textColor: kMainColorPage,
                      height: 135.h,
                      width: 290.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
       
      ],
    );
  }
}


