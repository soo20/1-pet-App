import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';

class Alart1 extends StatelessWidget {
  final String title;
  final String? message;
  final String confirmButtonText;
  final String confirmButtonText2;
  final String? message2;
  final double? customFontSize;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry padding2;

  const Alart1({
    super.key,
    required this.title,
    required this.confirmButtonText,
    required this.confirmButtonText2,
    this.message,
    this.message2,
    this.customFontSize,
    required this.padding,
    required this.padding2,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        // alignment: Alignment.center,
        child: Container(
      height: 550.h,
      width: 850.w, // Adjust as needed
      decoration: BoxDecoration(
        color: const Color(0xffefe6e5),
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(width: 1.0, color: const Color(0xff707070)),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: padding,
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: customFontSize ?? 44.sp,
                      color: const Color(0xff19283F),
                    ),
                    children: [
                      TextSpan(
                          text: title,
                          style: const TextStyle(fontWeight: FontWeight.w400)),
                      TextSpan(
                        text: message,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                          text: message2,
                          style: const TextStyle(fontWeight: FontWeight.w400)),
                    ],
                  ),
                  textHeightBehavior:
                      const TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
                Padding(
                  padding: padding2,
                  child: CustomGeneralButtom(
                    customFontSize: 47.sp,
                    height: 125.h,
                    text: confirmButtonText,
                    onTap: () {},
                    textColor: kMainColorPage,
                    boxColor: const Color(0xffA26874),
                    fontWeight: FontWeight.w800,
                    width: 600.w,
                    borderColor: kMainColorSplash,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: CustomGeneralButtom(
                    customFontSize: 47.sp,
                    height: 125.h,
                    text: confirmButtonText2,
                    textColor: kMainColorPage,
                    boxColor: const Color(0xff354A6B),
                    fontWeight: FontWeight.w800,
                    width: 600.w,
                    borderColor: kMainColorPage,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    ));
  }
}
