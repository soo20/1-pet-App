// ignore_for_file: unused_import, prefer_const_constructors
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petapplication/Welcome/presention/widgets/welcom_pageview.dart';
import 'package:petapplication/Welcome/presention/widgets/dotidicate.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/define_page/widgets/choose_defintion_type.dart';
import 'package:petapplication/pages/sign_login_acount/logintext.dart';
//import 'package:petapplication/core/utils/widgets/constants.dart';
//import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({super.key});

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColorPage,
      body: Column(
        children: [
          Expanded(
            child: WelcomPageView(
              pageController: pageController,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 90.w, bottom: 135.h),
                child: Dot(
                  dotIndex:
                      pageController!.hasClients ? pageController?.page : 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
