import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/core/utils/widgets/space.dart';
import 'package:petapplication/pages/page2/login_info.dart';
import 'package:petapplication/pages/page2/sign_up_body.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);


  @override
  State<LoginBody> createState() => _LoginBodyState();
  
}

class _LoginBodyState extends State<LoginBody> {
  // ignore: non_constant_identifier_names
  void LoginBodyStat(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const SignUpPody(),
    );
  }
  @override
  Widget build(BuildContext context) {
    double aspectRatio = SizeConfig.screenWidth! / SizeConfig.screenHeight!;
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Scaffold(
     body: Column(
        children: [
          const VerticalSpace(8.5),
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
          
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.defaultSize! * 1.5,
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
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.defaultSize! * 0.001,
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
                  vertical: SizeConfig.defaultSize! * 1.4,
                  horizontal: SizeConfig.defaultSize! * 8),
              child: CustomGeneralButtom2(
                height: 42,
                text: 'LOGIN WITH EMAIL',
                onTap: () {
                  navigator?.push(
                      MaterialPageRoute(builder: (e) => const LoginInfo()));
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
       
        RichText(
  text: TextSpan(
    text: 'Don\'t have an account? ',
    style: const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      color: Color(0xff090f0f),
      fontWeight: FontWeight.w400,
    ),
    children: <TextSpan>[
      TextSpan(
        text: 'Sign Up',
        style:const  TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14.4,
          color: Color(0xff090f0f),
          fontWeight: FontWeight.w900,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            // Handle the tap on "Sign Up"
            // Add your navigation logic or any other action here
           navigator?.push(
                      MaterialPageRoute(builder: (e) =>  const SignUpPody()));
          },
          

      ),
    ],
  ),
  textAlign: TextAlign.center,
),
          // Add the rest of your widgets here, for example, text fields, buttons, etc.
        ],
        
      ),
      ),
    );
  }
}


