import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/pages/page3/camera.dart';

class Alart2 extends StatelessWidget {
  const Alart2({super.key, required this.text1, required this.text1buttom, required this.text2buttom});
 final String text1;
 final String text1buttom;
 final String text2buttom;
  @override
  Widget build(BuildContext context) {
     
    return Align(
       // alignment: Alignment.center,
        child: Container(
        
          height: 500.h,
          width: 770.w, // Adjust as needed
         decoration: BoxDecoration(
      color: const Color(0xffefe6e5),
      borderRadius: BorderRadius.circular(27.0),
      border: Border.all(width: 1.0, color: const Color(0xff707070)),
    ),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 23.0),
                    child: Column(
                      children: [
                         Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 46.sp,
                              color: const Color(0xff080808),
                            ),
                            children:  [
                              TextSpan(
                                text: text1,
                              style: const TextStyle(fontWeight: FontWeight.w400)
                              ),
                             
                            ],
                          ),
                          textHeightBehavior:
                              const TextHeightBehavior(applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                             top: 10,),
                          child: CustomGeneralButtom(
                            customFontSize: 37.sp,
                            height: 105.h,
                            text: text1buttom,
                            onTap: () {
                              Get.to(() =>  const CameraAlt(),transition: Transition.native);
                            },
                            textColor: kMainColorPage,
                            boxColor: const Color(0xffA26874),
                            fontWeight: FontWeight.w800,
                            width: 550.w,
                            borderColor:const Color(0xffA26874),
                          ),
                        ),
                        Padding(
                           padding: const EdgeInsets.only(
                             top: 5,),
                          child: CustomGeneralButtom(
                             customFontSize: 40.sp,
                            height: 105.h,
                            text: text2buttom,
                            textColor: kMainColorPage,
                            boxColor: const Color(0xff354A6B),
                            fontWeight: FontWeight.w800,
                            width: 550.w,
                            borderColor:const Color(0xff354A6B),
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