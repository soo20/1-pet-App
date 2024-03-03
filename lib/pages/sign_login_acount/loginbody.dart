// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';


import 'package:petapplication/pages/sign_login_acount/login_info_email_pass.dart';
import 'package:petapplication/pages/sign_login_acount/page_view_login.dart';

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
   // double aspectRatio = SizeConfig.screenWidth! / SizeConfig.screenHeight!;
    return Scaffold(
      backgroundColor: kMainColorSplash,
     body: Center(
       child: Column(
        
          children: [
            SizedBox(height: 200.h,),
            Text(
              'Yuna\n',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 115.sp,
                color: const Color(0xff0b2f37),
                fontWeight: FontWeight.w600,
                height:  1.h,
              ),
            ),
           SizedBox(height: 0,),
         Image.asset('assets/image/Group841.png',width: 687.w,),
           
            //
            //SizedBox(height: 20.h,),
       
            Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal:  0),
                child:  CustomGeneralButtom2(
                  height: 114.h,
                  text: 'Login With GmaiL',
                  textColor: kMainColorPage,
                  icon: FontAwesomeIcons.google,
                  iconcolor: Color.fromARGB(255, 248, 54, 90),
                  boxColor: kMainColor,
                  borderColor: kMainColor,
                  width: 730.w,
                ),
              ),
            ),
        
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical:0,
                    horizontal:  0),
                child: CustomGeneralButtom2(
                  height: 114.h,
                  text: 'Login With Facebook',
                  icon: FontAwesomeIcons.facebook,
                  iconcolor: kMainColorPage,
                  textColor: kMainColorPage,
                  boxColor: kMainColorSplash,
                  borderColor: kMainColorPage,
                  width: 730.w,
                ),
              ),
            ),
           
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical:9,
                    horizontal:  0),
                child: CustomGeneralButtom2(
                  height: 110.h,
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
                  boxColor:  Color(0xffF83658),
                  borderColor: const Color.fromARGB(255, 248, 54, 90),
                  width: 730.w,
                ),
              ),
            ),
           
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  SizedBox(
                    width: 200.w,
                  ),
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 35.sp,
                      color: Color(0xff090f0f),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
               
            
           
            CupertinoButton(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 44.sp,
                  color: Color(0xff090f0f),
                  fontWeight: FontWeight.w900,
                  height: 0.01.h,
                 
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
                            width: 1080.w,
                            height: 1000.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffEEEFEF),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(70.0),
                                topRight: Radius.circular(70.0),
                                bottomLeft: Radius.circular(00.0),
                                bottomRight: Radius.circular(00.0),
                              ),
                              border: Border.all(
                                  width: 0.5.w,
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
                                  children: [
                                    SizedBox(
                                      height: 170.h,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'Cosffira',
                                          fontSize: 70.sp,
                                          color: Color(0xfff83658),
                                          height: 1.0434782608695652,
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: 'Create ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'an account',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1000.h,
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
          


           ]),
            // Add the rest of your widgets here, for example, text fields, buttons, etc.
          ],
        ),
     ),
    );
  }
}
