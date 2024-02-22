// ignore_for_file: unused_import
import 'dart:core';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
//ده فايل هستخدمه كتير علشان هحط فيه كل البوتمز الي هستخدمها
import 'package:petapplication/core/utils/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//ده يستخدم اكتر حاجه
class CustomGeneralButtom extends StatelessWidget {
  const CustomGeneralButtom({
    super.key,
    this.text,
    this.svgPath,
    this.onTap,
    this.buttonTextResolver,
    required this.boxColor,
    required this.textColor,
    this.fontWeight,
    required this.height,
    this.width,
    this.borderColor,
  });
  final Color boxColor;
  final String? text;
  final String? svgPath;
  final FontWeight? fontWeight;
  final double? height;
  final double? width;
  final Color? textColor;
  final Color? borderColor;

  final String Function(int)? buttonTextResolver;
  // void function
  final VoidCallback? onTap;
  // Path to your SVG asset or SVG string

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        // خليته ياخد العرض بتاع الاسكرين علشان اغير في الحجم براحتي
        width: width,
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(35.r),
            border: Border.all(color: borderColor!),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 106, 105, 105)
                    .withOpacity(0.3), // Shadow color
                offset: const Offset(0.5, 2.0), // Shadow offset
                blurRadius: 1, // Shadow blur radius
                spreadRadius: 1.0, // Shadow spread radius
              ),
            ]),
        //The Row widget contains an Expanded widget that wraps your existing
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // Align content to the end (far right)
          children: [
            Expanded(
              // Adjust the right padding as needed
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    child: Text(
                      text ??
                          'Default Text', // Provide a default value if text is null
                      style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 17.sp,
                        color: textColor,
                        fontWeight: fontWeight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomGeneralButtom2 extends StatelessWidget {
  final Color boxColor;
  final Color textColor;
  final IconData? icon;
  final Color? iconcolor;
  final Color? borderColor;
  final double height;
  final double? width;
  const CustomGeneralButtom2({
    super.key,
    this.text,
    this.svgPath,
    this.onTap,
    this.buttonTextResolver,
    required this.boxColor,
    required this.textColor,
    this.icon,
    required this.borderColor,
    this.iconcolor,
    required this.height,
    required this.width,
  });
  final String? text;
  final String? svgPath;

  final String Function(int)? buttonTextResolver;
  // void function
  final VoidCallback? onTap;
  // Path to your SVG asset or SVG string

  @override
  Widget build(BuildContext context) {
    var aalignment = const Alignment(-0.531, 0.133);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        // خليته ياخد العرض بتاع الاسكرين علشان اغير في الحجم براحتي
        width: width,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(35.r),
          border: Border.all(color: borderColor!),
        ),
        //The Row widget contains an Expanded widget that wraps your existing
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceAround, // Align content to the end (far right)
          children: [
            // Alignment(x, y)

            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 11.1),
                child: Icon(
                  icon,
                  color: iconcolor,
                ),
              ),
            Expanded(
              // Adjust the right padding as needed
              child: Stack(
                // alignment: Alignment.centerLeft,
                children: <Widget>[
                  Positioned(
                    child: Align(
                      alignment: aalignment,
                      child: Text(
                        text!, // Provide a default value if text is null
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 16.5.sp,
                          color: textColor,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomGeneralButtom3 extends StatelessWidget {
  final Color boxColor;

  const CustomGeneralButtom3({
    super.key,
    this.text,
    this.svgPath,
    this.onTap,
    this.buttonTextResolver,
    required this.boxColor,
    required this.textColor,
    this.fontWeight,
    required this.height,
    this.width,
    this.dou,
  });
  final String? text;
  final String? svgPath;
  final FontWeight? fontWeight;
  final double? height;
  final double? width;
  final Color? textColor;
  final double? dou;

  final String Function(int)? buttonTextResolver;
  // void function
  final VoidCallback? onTap;
  // Path to your SVG asset or SVG string

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        // خليته ياخد العرض بتاع الاسكرين علشان اغير في الحجم براحتي
        width: width,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: const BorderRadius.all(Radius.elliptical(60, 55)).r,
        ),
        //The Row widget contains an Expanded widget that wraps your existing
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // Align content to the end (far right)
          children: [
            Expanded(
              // Adjust the right padding as needed
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    child: Icon(
                      Icons.camera_alt,
                      weight: 600.w,
                      size: 40.sp,
                      color: const Color(0xffE3B1A8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//textAlign: TextAlign.center,
class CustomGeneralButtom4 extends StatelessWidget {
  final Color boxColor;
  final Color textColor;
  final IconData? icon;
  final Color? iconcolor;
  final Color? borderColor;
  final double height;
  final double? width;
  final FontWeight? fontWeight;
  const CustomGeneralButtom4({
    super.key,
    this.text,
    this.svgPath,
    this.onTap,
    this.buttonTextResolver,
    required this.boxColor,
    required this.textColor,
    this.icon,
    required this.borderColor,
    this.iconcolor,
    required this.height,
    required this.width,
    this.fontWeight,
  });
  final String? text;
  final String? svgPath;

  final String Function(int)? buttonTextResolver;
  // void function
  final VoidCallback? onTap;
  // Path to your SVG asset or SVG string

  @override
  Widget build(BuildContext context) {
    // var aalignment =const Alignment(-0.531, 0.133);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        // خليته ياخد العرض بتاع الاسكرين علشان اغير في الحجم براحتي
        width: width,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: borderColor!, width: 1.2),
        ),
        //The Row widget contains an Expanded widget that wraps your existing
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceAround, // Align content to the end (far right)
          children: [
            // Alignment(x, y)

            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 11.1),
                child: Icon(
                  icon,
                  color: iconcolor,
                ),
              ),
            Expanded(
              // Adjust the right padding as needed
              child: Stack(
                // alignment: Alignment.centerLeft,
                children: <Widget>[
                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        text!, // Provide a default value if text is null
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 14,
                          color: textColor,
                          fontWeight: fontWeight,
                        ),
                        textAlign: TextAlign.left,
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
