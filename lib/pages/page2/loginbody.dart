// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/core/utils/widgets/space.dart';
import 'package:petapplication/pages/page2/login_info.dart';
import 'package:petapplication/pages/page2/page_view_login.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> with TickerProviderStateMixin {
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
    double aspectRatio = SizeConfig.screenWidth! / SizeConfig.screenHeight!;
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Scaffold(
        backgroundColor: kMainColorSplash,
        body: Column(
          children: [
            const VerticalSpace(8.0),
            Text(
              'Yuna\n',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 50,
                color: const Color(0xff0b2f37),
                fontWeight: FontWeight.w600,
                height: SizeConfig.defaultSize! * 0.03,
              ),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 30,
              width: SizeConfig.defaultSize! * 30,
              child: Image.asset('assets/image/Group841.png'),
            ),
            SizedBox(height: 20,),
            Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * .5,
                    horizontal: SizeConfig.defaultSize! * 8),
                child: const CustomGeneralButtom2(
                  height: 42,
                  text: 'LOGIN WITH GMAIL',
                  textColor: kMainColorPage,
                  icon: FontAwesomeIcons.google,
                  iconcolor: Color.fromARGB(255, 248, 54, 90),
                  boxColor: kMainColor,
                  borderColor: kMainColor,
                  width: null,
                ),
              ),
            ),

            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 0.1,
                    horizontal: SizeConfig.defaultSize! * 8),
                child: CustomGeneralButtom2(
                  height: 42,
                  text: 'LOGIN WITH FACEBOOK',
                  icon: FontAwesomeIcons.facebook,
                  iconcolor: kMainColorPage,
                  textColor: kMainColorPage,
                  boxColor: kMainColorSplash,
                  borderColor: kMainColorPage,
                  width: SizeConfig.screenWidth,
                ),
              ),
            ),

            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * .5,
                    horizontal: SizeConfig.defaultSize! * 8),
                child: CustomGeneralButtom2(
                  height: 42,
                  text: 'LOGIN WITH EMAIL',
                  onTap: () {
                    navigator?.pushAndRemoveUntil(
                      MaterialPageRoute(builder: (e) => const LoginInfo()),
                      (route) => true,
                    );
                  },
                  textColor: kMainColorPage,
                  icon: FontAwesomeIcons.envelope,
                  iconcolor: kMainColorPage,
                  boxColor: const Color.fromARGB(255, 248, 54, 90),
                  borderColor: const Color.fromARGB(255, 248, 54, 90),
                  width: null,
                ),
              ),
            ),

            const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 115,
                  ),
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.5,
                      color: Color(0xff090f0f),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
            SizedBox(
              width: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                //  Transform(transform: transform)
                CupertinoButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Color(0xff090f0f),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  onPressed: () {
                    showCupertinoModalPopup(
                        barrierDismissible: true,
                        context: context,
                        builder: (BuildContext builder) {
                          return CupertinoPopupSurface(
                              isSurfacePainted: false,
                              child: Container(
                                width: double.infinity,
                                height: 430,
                                decoration: BoxDecoration(
                                  color: const Color(0xffEEEFEF),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(70.0),
                                    topRight: Radius.circular(70.0),
                                    bottomLeft: Radius.circular(00.0),
                                    bottomRight: Radius.circular(00.0),
                                  ),
                                  border: Border.all(
                                      width: 0.5,
                                      color: const Color(0xff707070)),
                                ),
                                child: Scaffold(
                                  backgroundColor:
                                      Color.fromARGB(0, 238, 239, 239),
                                  body: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 45,
                                              color: Color(0xfff83658),
                                              height: 1.0434782608695652,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'create ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'an \n  account',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 280,
                                          child: PageViewLogin(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        });
                  },
                ),
              ],
            ),

            // Add the rest of your widgets here, for example, text fields, buttons, etc.
          ],
        ),
      ),
    );
  }
}
