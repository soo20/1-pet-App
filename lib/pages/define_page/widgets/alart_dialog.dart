import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/page3/camera.dart';

class AlartDialogPage extends StatelessWidget {
  const AlartDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        // alignment: Alignment.center,
        child: Container(
      height: 520.h,
      width: 950.w, // Adjust as needed
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/Group797.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 39.sp,
                          color: const Color(0xff080808),
                        ),
                        children: const [
                          TextSpan(
                              text: 'allow',
                              style: TextStyle(fontWeight: FontWeight.w400)),
                          TextSpan(
                            text: ' "yuna app" ',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                              text: 'to access\nyour camera on this device"',
                              style: TextStyle(fontWeight: FontWeight.w400)),
                        ],
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: CustomGeneralButtom(
                        customFontSize: 33.sp,
                        height: 100.h,
                        text: 'While Using this app',
                        onTap: () {
                          Get.to(() => const CameraAlt(),
                              transition: Transition.native);
                        },
                        textColor: kMainColorPage,
                        boxColor: kMainColor,
                        fontWeight: FontWeight.w800,
                        width: 550.w,
                        borderColor: kMainColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: CustomGeneralButtom(
                        customFontSize: 35.sp,
                        height: 100.h,
                        text: 'Decline',
                        textColor: kMainColorPage,
                        boxColor: const Color(0xffE3B1A8),
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
            ))
          ],
        ),
      ),
    ));
  }
}
