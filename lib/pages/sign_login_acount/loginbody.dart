// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';

import 'package:petapplication/pages/sign_login_acount/auth_app.dart';
import 'package:petapplication/pages/sign_login_acount/login_info_email_pass.dart';

import 'package:petapplication/pages/sign_login_acount/page_view_login.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

bool ratio = false;

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
        setState(() {
          ratio = true;
        });
      });
    ratio = false;
    super.initState();
  }

  Future<void> _showProgressDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    _showProgressDialog(context);
    try {
      UserCredential? userCredential = await signInWithGoogle();
      if (userCredential != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TheMainHomePage()),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        error is NewUserException
            ? SnackBar(
                elevation: 1,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
                content: Text(
                  error.message,
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 16, // Adjust the font size as needed
                    color: const Color(0xffEFE6E5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                action: SnackBarAction(
                    label: 'Sign up',
                    textColor: const Color(0xff4A5E7C),
                    onPressed: () {
                      setState(() {
                        showSecondContainer =
                            !showSecondContainer; // Toggle the visibility of the second container
                      });
                    }),
              )
            : SnackBar(
                elevation: 1,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
                content: Text(
                  "Failed to login with Gmail, try again later",
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 16, // Adjust the font size as needed
                    color: const Color(0xffEFE6E5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      );
    } finally {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TheMainHomePage()),
        );
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xffEFE6E5),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  width: width * 0.7,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.02,
                  ),
                  child: CustomGeneralButtom2(
                    height: height * 0.068,
                    onTap: () => _signInWithGoogle(context),
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
                      signInWithFacebook().then((_) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TheMainHomePage()),
                        );
                      }).catchError((onError) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          onError is NewUserException
                              ? SnackBar(
                                  elevation: 1,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Adjust the radius as needed
                                  ),
                                  content: Text(
                                    onError.message,
                                    style: TextStyle(
                                      fontFamily: 'Cosffira',
                                      fontSize:
                                          16, // Adjust the font size as needed
                                      color: const Color(0xffEFE6E5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  action: SnackBarAction(
                                      label: 'Sign up',
                                      textColor: const Color(0xff4A5E7C),
                                      onPressed: () {
                                        PageViewLogin();
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                      }),
                                )
                              : SnackBar(
                                  elevation: 1,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Adjust the radius as needed
                                  ),
                                  content: Text(
                                    "Failed to login with facebook, try again later",
                                    style: TextStyle(
                                      fontFamily: 'Cosffira',
                                      fontSize:
                                          16, // Adjust the font size as needed
                                      color: const Color(0xffEFE6E5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                        );
                      });
                    },
                    height: height * 0.068,
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
                    height: height * 0.068,
                    text: 'Login With Email',
                    onTap: () {
                      navigator?.pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (e) => const TheMainLoginPage()),
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
                  height: height * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 47.sp,
                      color: Color(0xff090f0f),
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 55.sp,
                          color: const Color(0xff4A5E7C),
                          fontWeight: FontWeight.w900,
                          height: 0.03.h,
                        ),
                        // Add onTap callback to navigate to the next page
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              showSecondContainer =
                                  !showSecondContainer; // Toggle the visibility of the second container
                            });
                          },
                      ),
                    ],
                  ),
                ),

                // Add the rest of your widgets here, for example, text fields, buttons, etc.
              ],
            ),
          ),
        ),
        bottomNavigationBar: showSecondContainer
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    showSecondContainer = true;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Container(
                      height: ratio ? height * 0.9 : height * 0.5,
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
                            offset:
                                Offset(10, 100), // changes position of shadow
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
      ),
    );
  }
}
