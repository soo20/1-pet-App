// ignore_for_file: unused_import, prefer_const_constructors

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petapplication/Welcome/presention/widgets/custom_welcompage.dart';
import 'package:petapplication/Welcome/presention/widgets/dotidicate.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/page1/Defindpage.dart';
import 'package:petapplication/pages/page1/widgets/Defind.dart';
//import 'package:petapplication/core/utils/widgets/constants.dart';
//import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key? key}) : super(key: key);

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
    return Stack(
      children: [
        CustomWelcomPage(
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
        Visibility(
          visible: pageController!.hasClients
              ? (pageController?.page == 0 ? true : false)
              : true,
          child: Positioned(
            top: SizeConfig.defaultSize! * 6,
            right: 32,
            child: const Text(
              'Skip',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Color.fromRGBO(11, 47, 55, 1),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              top: SizeConfig.defaultSize! * 6.5,
              left: 15,
              child: SvgPicture.asset(
                'assets/icons/ic_arrow_back.svg',
                width: 100,
                height: 27,
                fit: BoxFit.cover,
              ),
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Positioned(
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
                              DeefindPage(), // Replace YourNextPage with the actual class for the next page
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 500),
                        );
                      }
                    },
                    text: pageController?.hasClients == true
                        ? (pageController?.page == 5 ? 'Finish' : 'Contnous')
                        : 'Let\'s Meet', textColor: kMainColorPage,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
