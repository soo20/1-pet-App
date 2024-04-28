import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:petapplication/pages/define_page/widgets/choose_defintion_type.dart';
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
            toolbarHeight: 60,
            leading: IconButton(
              icon: Text(
                'skip',
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 60.sp,
                  color: const Color(0xffA26874),
                  fontWeight: FontWeight.w900,
                ),
              ),
              onPressed: () {
                Get.to(() => const ChooseDefintionType(),
                    transition: Transition.size);
                // Add any functionality you want when the icon is pressed
              },
              padding: const EdgeInsets.only(left: 0.0),
            )),
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xffEFE6E5),
        body:
            // SignUpPody()
            const LoginBody());
  }
}
