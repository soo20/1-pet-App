import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';

class Alart1 extends StatelessWidget {
  const Alart1({super.key});

  @override
  Widget build(BuildContext context) {
     
    return Align(
       // alignment: Alignment.center,
        child: Container(
        
          height: 520.h,
          width: 800.w, // Adjust as needed
         decoration: BoxDecoration(
      color: const Color(0xffefe6e5),
      borderRadius: BorderRadius.circular(40.0),
      border: Border.all(width: 1.0, color: const Color(0xff707070)),
    ),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 27.0),
                    child: Column(
                      children: [
                         Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 44.sp,
                              color: const Color(0xff080808),
                            ),
                            children: const [
                              TextSpan(
                                text: 'allow',
                              style: TextStyle(fontWeight: FontWeight.w400)
                              ),
                              TextSpan(
                                text: ' "yuna app" ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: 'to access\nyour camera on this device"',
                                style: TextStyle(fontWeight: FontWeight.w400)
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
                            text: 'While Using this app',
                            onTap: () {
                             // Get.to(() =>  const CameraAlt(),transition: Transition.native);
                            },
                            textColor: kMainColorPage,
                            boxColor: const Color(0xffA26874),
                            fontWeight: FontWeight.w800,
                            width: 550.w,
                            borderColor: kMainColorSplash,
                          ),
                        ),
                        Padding(
                           padding: const EdgeInsets.only(
                             top: 5,),
                          child: CustomGeneralButtom(
                             customFontSize: 40.sp,
                            height: 105.h,
                            text: 'Decline',
                            textColor: kMainColorPage,
                            boxColor: const Color(0xff354A6B),
                            fontWeight: FontWeight.w800,
                            width: 550.w,
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