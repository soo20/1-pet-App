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
      backgroundColor: Color(0xffEFE6E5),
     body: Center(
       child: Column(
        
          children: [
            SizedBox(height: 220.h,),
            Text(
              'Yuna\n',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 130.sp,
                color: const Color(0xff4A5E7C),
                fontWeight: FontWeight.w600,
                height:  1.h,
              ),
            ),
           SizedBox(height: 0,),
         Image.asset('assets/image/yunaphoto.png',width: 700.w,),
           
            //
            //SizedBox(height: 20.h,),
       
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 8,
                    ),
                child:  CustomGeneralButtom2(
                  height: 115.h,

                  text: 'Login With Gmail',
                  textColor: const Color(0xffA26874),
                  icon: FontAwesomeIcons.google,
                  iconcolor: const Color(0xffA26874),
                  boxColor: Color(0xffB5C0D0),
                  borderColor: Color.fromARGB(105, 112, 112, 112),
                  width: 740.w,
                ),
              ),
            ),
        
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                    top:5,
                    ),
                child: CustomGeneralButtom2(
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
            ),
           
            Flexible(
              flex: 2,
              child: Padding(
                 padding: EdgeInsets.only(
                    top:5,
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
                  boxColor:  const Color(0xffA26874),
                  borderColor: const Color(0xffA26874),
                  width: 740.w,
                ),
              ),
            ),
           
           
             Text(
               'Don\'t have an account? ',
               style: TextStyle(
                 fontFamily: 'Cosffira',
                 fontSize: 45.sp,
                 color: Color(0xff090f0f),
                 fontWeight: FontWeight.w400,
               ),
             ),
                            
                         
                        
                         CupertinoButton(
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
                           
                           onPressed: () {
                             showCupertinoModalPopup(
               barrierDismissible: true,
               context: context,
               builder: (BuildContext builder) {
                 return CupertinoPopupSurface(
                     isSurfacePainted: false,
                     child: Container(
                       width: 1080.w,
                       height: 1070.h,
                       decoration: BoxDecoration(
                         color: const Color(0xffDCD3D3),
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
                                     fontSize: 100.sp,
                                     color: Color(0xff354A6B),
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
            // Add the rest of your widgets here, for example, text fields, buttons, etc.
          ],
        ),
     ),
    );
  }
}
