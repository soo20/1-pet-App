// ignore_for_file: unused_import, prefer_const_constructors

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petapplication/Welcome/presention/widgets/welcom_pageview.dart';
import 'package:petapplication/Welcome/presention/widgets/dotidicate.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/pages/define_page/widgets/Defind.dart';
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
      body: Stack(
        children: [
         WelcomPageView(
            pageController: pageController,
          ),
          Positioned(
            left: 30,
            right: 0,
            bottom: SizeConfig.defaultSize! * 6,
            child: Dot(
              dotIndex: pageController!.hasClients ? pageController?.page : 0,
            ),
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: const [
              /* Positioned(
                top: SizeConfig.defaultSize! * 6.5,
                left: 15,
                child: SvgPicture.asset(
                  'assets/icons/ic_arrow_back.svg',
                  width: 100,
                  height: 27,
                  fit: BoxFit.cover,
                ),
              ),*/
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  /*const Positioned(
                    right: 33,
                    left: SizeConfig.defaultSize! * 28,
                    bottom: SizeConfig.defaultSize! * 4,
                    child: CustomGeneralButtom(
                      boxColor: kMainColor,
                      onTap: () {
                        if (pageController!.page! < 5) {
                          pageController?.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else {
                          Get.to(
                            () =>
                                LoginText(), // Replace YourNextPage with the actual class for the next page
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 500),
                          );
                        }
                      },
                      text: pageController?.hasClients == true
                          ? (pageController?.page == 5 ? 'Finish' : 'Contnous')
                          : 'Let\'s Meet', textColor: kMainColorPage, height: 60,
                    ),
                  ),*/
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
