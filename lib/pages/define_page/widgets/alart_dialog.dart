import 'package:flutter/material.dart';

import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

class AlartDialogPage extends StatelessWidget {
  const AlartDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    double aspectRatio = screenHeight / screenWidth;
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 220,
            width: 350, // Adjust as needed
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/Group797.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.023,
                      right: screenWidth * 0.045,
                      left: screenWidth * 0.045),
                  child: Column(
                    children: [
                      const Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 17,
                            color: Color(0xff080808),
                          ),
                          children: [
                            TextSpan(
                              text: 'allow',
                              
                              
                            ),
                            TextSpan(
                              text: ' "yuna app" ',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            TextSpan(
                              text: 'to access\nyour camera on this device"',
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: CustomGeneralButtom4(
                          height: 38,
                          text: 'While Using this app',
                          onTap: () {
                            //Get.to(() =>  CameraAlt(cameras),transition: Transition.native);
                          },
                          textColor: kMainColorPage,
                          boxColor: kMainColor,
                          fontWeight: FontWeight.w900,
                          width: SizeConfig.screenWidth,
                          borderColor: kMainColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: CustomGeneralButtom4(
                          height: 38,
                          text: 'Decline',
                          textColor: kMainColorPage,
                          boxColor: const Color(0xffE3B1A8),
                          fontWeight: FontWeight.w900,
                          width: SizeConfig.screenWidth,
                          borderColor: kMainColorPage,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
