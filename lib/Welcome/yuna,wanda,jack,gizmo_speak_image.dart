

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';

import 'package:petapplication/pages/sign_login_acount/logintext.dart';

class Yyuna extends StatelessWidget {
  const Yyuna({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 165),
          child: SafeArea(
            // Add space to the left
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ), // Add space to the top
                Container(
                  width: 595.w,
                  height: 440.h,
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 0,
                  ),
                  decoration: BoxDecoration(
                      // color: const Color(0xffEEEFEF), // Box color
                      borderRadius: BorderRadius.circular(60.r),
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 0.4) // Border radius if needed
                      ),
                  child: Center(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      'Unlock a world of pet love with\nme and my friends: \n Connect,share, and enhance\nyour furry friend  life,are you\'s\nready to meet my friends? \n',
                      style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 31.sp,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: SvgPicture.string(
                    '<svg viewBox="76.2 386.5 158.9 140.5" ><path transform="translate(-1877.52, 4023.51)" d="M 2112.6181640625 -3637 L 2060.0625 -3545.62158203125 L 1953.72900390625 -3496.4853515625 L 1953.72900390625 -3496.4853515625 L 2016.062255859375 -3545.62158203125 L 2003.840087890625 -3637 L 2112.6181640625 -3637 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.contain,
                    width: 180.w,
                    height: 180.h,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              0.0, 170, 0, 0), // Add padding of 8.0 to all sides
          child: Image.asset(
            'assets/image/Group315.png',
            width: 660.w,
            height: 1100.h,
            fit: BoxFit.contain, // Adjust the fit as needed
          ),
        ),
      ],
    );
  }
}

class Jjack extends StatelessWidget {
  const Jjack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 50),
          child: SafeArea(
            // Add space to the left
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ), // Add space to the top
                Container(
                  width: 540.w,
                  height: 380.h,
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 0,
                  ),
                  decoration: BoxDecoration(
                      // color: const Color(0xffEEEFEF), // Box color
                      borderRadius: BorderRadius.circular(60.r),
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 0.4) // Border radius if needed
                      ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Hi, I\'m Jack.',
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 42.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                ' in our app\nrecognizes your pet from their\nphoto and provides key\ninformation. Welcome to a\nworld where your pet shines!\n',
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 40.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: SvgPicture.string(
                    _svg_pp2ta,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.contain,
                    width: 160.w,
                    height: 150.h,
                  ),
                ),
                SizedBox(
                  height: 0.h,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              190.0, 150, 00, 0), // Add padding of 8.0 to all sides
          child: Image.asset(
            'assets/image/Group327.png',
            width: 730.w,
            height: 1150.h,
            fit: BoxFit.fill, // Adjust the fit as needed
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
        Padding(
          padding: const EdgeInsets.only(top: 70, left: 160),
          child: SafeArea(
            // Add space to the left
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ), // Add space to the top
                Container(
                  width: 545.w,
                  height: 380.h,
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 0,
                  ),
                  decoration: BoxDecoration(
                      // color: const Color(0xffEEEFEF), // Box color
                      borderRadius: BorderRadius.circular(60.r),
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 0.4) // Border radius if needed
                      ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Hey pet pals!\n Gizmo here',
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 44.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                ' Our app now\n detects skin and fecal \n issues for your furry\nbuddies. It\'s like a health \nsuperhero in your pocket! ',
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 40.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: SvgPicture.string(
                    '<svg viewBox="76.2 386.5 158.9 140.5" ><path transform="translate(-1877.52, 4023.51)" d="M 2112.6181640625 -3637 L 2060.0625 -3545.62158203125 L 1953.72900390625 -3496.4853515625 L 1953.72900390625 -3496.4853515625 L 2016.062255859375 -3545.62158203125 L 2003.840087890625 -3637 L 2112.6181640625 -3637 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.contain,
                    width: 160.w,
                    height: 160.h,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              10.0, 260, 0, 0), // Add padding of 8.0 to all sides
          child: Image.asset(
            'assets/image/Group737.png',
            width: 615.w,
            height: 750.h,
            fit: BoxFit.contain, // Adjust the fit as needed
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
        Padding(
          padding: const EdgeInsets.only(left: 70, top: 30),
          child: SafeArea(
            // Add space to the left
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ), // Add space to the top
                Container(
                  width: 600.w,
                  height: 380.h,
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 00,
                  ),
                  decoration: BoxDecoration(
                      // color: const Color(0xffEEEFEF), // Box color
                      borderRadius: BorderRadius.circular(60.r),
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 0.4) // Border radius if needed
                      ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Hey pet lovers! Wanda here',
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 39.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                ' with \nexciting news—our app now has a\nreminder system! Enjoy timely pet\ncare prompts and manage\nimportant dates, Join Us on this\nConvenient, journey!',
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 39.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: SvgPicture.string(
                    _svg_pp2ta,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.contain,
                    width: 150.w,
                    height: 140.h,
                  ),
                ),
                SizedBox(
                  height: 800.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
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
                        boxColor: kMainColor,
                        fontWeight: FontWeight.w600,
                        customFontSize: 40.sp,
                        borderColor: const Color(0xff707070),
                        onTap: () {
                          Get.to(
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
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              210.0, 235, 00, 0), // Add padding of 8.0 to all sides
          child: Image.asset(
            'assets/image/Group1021.png',
            width: 430.w,
            height: 790.h,
            fit: BoxFit.fill, // Adjust the fit as needed
          ),
        ),
      ],
    );
  }
}

// ignore: constant_identifier_names
const String _svg_pp2ta =
    '<svg viewBox="299.2 364.0 181.2 160.2" ><path transform="translate(-1654.57, 4001.0)" d="M 1953.72900390625 -3637 L 2013.6484375 -3532.818359375 L 2134.880859375 -3476.79736328125 L 2134.880859375 -3476.79736328125 L 2063.813720703125 -3532.818359375 L 2077.748291015625 -3637 L 1953.72900390625 -3637 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
