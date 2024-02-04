import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/pages/define_page/Defindpage.dart';
import 'package:petapplication/pages/page2/loginbody.dart';
//import 'package:petapplication/core/utils/widgets/constants.dart';
//import 'package:petapplication/pages/page2/login_info.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 1,
            automaticallyImplyLeading: false,

            //iconTheme: IconThemeData.fallback(),
            forceMaterialTransparency: true,
            toolbarOpacity: 1,
            toolbarHeight: 40,
            leading: IconButton(
              icon: const Text(
                'Skip',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  color: Color(0xffEEEFEF),
                  fontWeight: FontWeight.w900,
                ),
              ),
              onPressed: () {
                Get.to(() => const DeefindPage(), transition: Transition.size);
                // Add any functionality you want when the icon is pressed
              },
            )),
        extendBodyBehindAppBar: true,
        backgroundColor: kMainColorSplash,
        body: const Column(children: [
          // SignUpPody()
          LoginBody()
        ]));
  }
}
