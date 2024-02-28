import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';

import 'package:petapplication/pages/define_page/widgets/Defind.dart';
import 'package:petapplication/pages/sign_login_acount/loginbody.dart';
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
            toolbarHeight: 50,
            leading: IconButton(
              icon:  Text(
                'skip',
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 45.sp,
                  color: const Color(0xffEEEFEF),
                  fontWeight: FontWeight.w900,
                  
                ),
              ),
              onPressed: () {
                Get.to(() => const Deefine(), transition: Transition.size);
                // Add any functionality you want when the icon is pressed
              },
               padding: const EdgeInsets.only(
              left: 15.0),
            )),
        extendBodyBehindAppBar: true,
        backgroundColor: kMainColorSplash,
        body: 
          // SignUpPody()
          const LoginBody()
        );
  }
}
