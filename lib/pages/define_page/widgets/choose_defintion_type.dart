import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/pages/define_page/jack_define.dart';
import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';
import 'package:petapplication/pages/pet_setting_pages/add_pet.dart';

//import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

class ChooseDefintionType extends StatelessWidget {
  const ChooseDefintionType({
    super.key,
  });

  // rest of the code...

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) => () {
        navigator?.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (e) => const TheMainHomePage(
              index1: 1,
            ),
          ),
          (route) => true,
        );
        //
      },
      child: Scaffold(
        backgroundColor: const Color(0xffEFE6E5),
        appBar: AppBar(
          elevation: 1,

          automaticallyImplyLeading: false,

          //iconTheme: IconThemeData.fallback(),
          forceMaterialTransparency: true,
          toolbarOpacity: 1,
          toolbarHeight: size.height * 0.039,

          leadingWidth: size.height * 0.040,

          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xff4A5E7C),
            ),
            onPressed: () {
              navigator?.pushAndRemoveUntil(
                MaterialPageRoute(builder: (e) => const TheMainHomePage()),
                (route) => true,
              );
              //
            },
            iconSize: size.width * 0.085,
            padding: EdgeInsets.only(
                left: size.height * 0.01), // Set the size of the arrow icon
          ),
        ),
        extendBodyBehindAppBar: F,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add space to the top
            Container(
              width: size.height * 0.400,
              height: size.height * 0.750,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/Group1886.png')),
              ),
            ),
            SizedBox(
              height: size.height * 0.0100,
            ),
            Center(
              //padding: const EdgeInsets.only(left:0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomGeneralButtom(
                    fontWeight: FontWeight.bold,
                    text: 'Define With Jack',
                    borderColor: const Color(0xFF4A5E7C),
                    onTap: () {
                      navigator?.pushAndRemoveUntil(
                        MaterialPageRoute(builder: (e) => const JackDefine()),
                        (route) => true,
                      );
                    },
                    textColor: const Color(0xFFFFFFFF),
                    boxColor: const Color(0xFF4A5E7C),
                    height: 130.h,
                    width: 370.w,
                    customFontSize: 35.r,
                  ),
                  SizedBox(
                    width: 70.w,
                  ),
                  CustomGeneralButtom(
                    fontWeight: FontWeight.bold,
                    text: 'Add Manually ',
                    textColor: const Color(0xFFFFFFFF),
                    boxColor: const Color(0xFFA26874),
                    height: 130.h,
                    width: 370.w,
                    customFontSize: 35.r,
                    onTap: () {
                      navigator?.pushAndRemoveUntil(
                        MaterialPageRoute(builder: (e) => AddPets()),
                        (route) => true,
                      );
                    },
                    borderColor: const Color(0xFFA26874),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//
