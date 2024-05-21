// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/define_page/widgets/choose_defintion_type.dart';
import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';

import 'package:petapplication/pages/sign_login_acount/auth_app.dart';
import 'package:petapplication/pages/sign_login_acount/login_info_email_pass.dart';

import 'package:petapplication/pages/sign_login_acount/page_view_login.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

String userId = 'null';

class _LoginBodyState extends State<LoginBody> with TickerProviderStateMixin {
  PageController? pageController;
  bool showSecondContainer = false;
  void toggleContainerVisibility() {
    setState(() {
      showSecondContainer = !showSecondContainer;
    });
  }

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
    // double aspectRatio = SizeConfig.screenWidth! / SizeConfig.screenHeight!;
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
      backgroundColor: Color(0xffEFE6E5),
      // resizeToAvoidBottomInset: true,

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 220.h,
            ),
            Text(
              'Yuna\n',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 130.sp,
                color: const Color(0xff4A5E7C),
                fontWeight: FontWeight.w600,
                height: 1.h,
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Image.asset(
              'assets/image/yunaphoto.png',
              width: 700.w,
            ),

            //
            //SizedBox(height: 20.h,),

            Padding(
              padding: EdgeInsets.only(
                top: 8,
              ),
              child: CustomGeneralButtom2(
                height: 115.h,
                onTap: () {
                  signInWithGoogle().then((userCredential) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TheMainHomePage()),
                    );
                  }).catchError((error) {
                    print(error);
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 1,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        content: Text(
                          error.toString(),
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 16, // Adjust the font size as needed
                            color: const Color(0xffEFE6E5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  });
                },
                text: 'Login With Gmail',
                textColor: const Color(0xffA26874),
                icon: FontAwesomeIcons.google,
                iconcolor: const Color(0xffA26874),
                boxColor: Color(0xffB5C0D0),
                borderColor: Color.fromARGB(105, 112, 112, 112),
                width: 740.w,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 5,
              ),
              child: CustomGeneralButtom2(
                onTap: () {
                  signInWithFacebook1().then((userCredential) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TheMainHomePage()),
                    );
                  }).catchError((error) {
                    print(error);
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 1,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        content: Text(
                          error.toString(),
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 16, // Adjust the font size as needed
                            color: const Color(0xffEFE6E5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  });
                },
                height: 120.h,
                text: 'Login With Facebook',
                icon: FontAwesomeIcons.facebook,
                iconcolor: kMainColorPage,
                textColor: kMainColorPage,
                boxColor: const Color(0xff4A5E7C),
                borderColor: kMainColorPage,
                width: 740.w,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 5,
              ),
              child: CustomGeneralButtom2(
                height: 115.h,
                text: 'Login With Email',
                onTap: () {
                  navigator?.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (e) => const LoginInfo()),
                    (route) => true,
                  );
                },
                textColor: kMainColorPage,
                icon: FontAwesomeIcons.envelope,
                iconcolor: kMainColorPage,
                boxColor: const Color(0xffA26874),
                borderColor: const Color(0xffA26874),
                width: 740.w,
              ),
            ),
            SizedBox(
              height: 0.h,
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 47.sp,
                      color: Color(0xff090f0f),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showSecondContainer =
                      !showSecondContainer; // Toggle the visibility of the second container
                });
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 55.sp,
                  color: const Color(0xff4A5E7C),
                  fontWeight: FontWeight.w900,
                  height: 0.03.h,
                ),
              ),
            ),
            // Add the rest of your widgets here, for example, text fields, buttons, etc.
          ],
        ),
      ),
      bottomNavigationBar: showSecondContainer
          ? GestureDetector(
              onTap: () {
                setState(() {
                  showSecondContainer = true; // hide container when tapped
                });
              },
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                  child: Container(
                    height: 1100.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/Rectangle.png'),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 90,
                          blurRadius: 100,
                          offset: Offset(10, 100), // changes position of shadow
                        ),
                      ],
                    ), // Customize as needed
                    child: PageViewLogin(
                      toggleContainerVisibility: toggleContainerVisibility,
                    ),
                  ),
                ),
              ))
          : const SizedBox(),
    );
  }
}
