
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/core/utils/widgets/floating_action.dart';
import 'package:petapplication/core/utils/widgets/space.dart';
import 'package:petapplication/pages/page2/login_info.dart';

class SignUpPody extends StatefulWidget {
const SignUpPody({super.key});

  @override
  State<SignUpPody> createState() => _SignUpPodyState();
}

class _SignUpPodyState extends State<SignUpPody> {
  void LoginBodyStat(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const SignUpPody(),
    );
  }
 
  void initstate(){
    super.initState();
  }
  //final TextEditingController _titlecontroller = TextEditingController();
  void showBottomSheet(param0) {
  showModalBottomSheet(
    backgroundColor: const Color.fromARGB(0, 255, 214, 64),
    elevation: 0,
    isScrollControlled: true,
    context: context,
    builder: (_) => 
     
         Container(
            decoration: const BoxDecoration(
        color: Color(0xffEEEFEF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100.0),
          topRight: Radius.circular(100.0),
        ),
            ),
             child: Padding(
        padding:  EdgeInsets.only(
          right: 0,
          left: 0,
          top: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30 ,
        ),
        
       child : Column(
         
          mainAxisSize: MainAxisSize.min,

           crossAxisAlignment : CrossAxisAlignment.center ,
          children: [
            const SizedBox(
              height: 55,
            ),
           const  Text.rich(
            TextSpan(
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 45,
          color:  Color(0xfff83658),
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
            text: 'an \naccount',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
                              ),
                            ],
                          ),
                        ),
                       const  SizedBox(
                          height: 15,
                        )
        ,          
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 1.5,
                    horizontal: SizeConfig.defaultSize! * 7),
                child: const CustomGeneralButtom2(
                  height: 42,
                  text: 'Continue With Google',
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
                    horizontal: SizeConfig.defaultSize! * 7),
                child:const CustomGeneralButtom2(
                  height: 42,
                  text: 'Continue With Email',
                  textColor: kMainColorPage,
                  icon: FontAwesomeIcons.envelope,
                  iconcolor: kMainColorPage,
                  boxColor:  Color.fromARGB(255, 248, 54, 90),
                  borderColor:  Color.fromARGB(255, 248, 54, 90),
                  width: null,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 1.4,
                    horizontal: SizeConfig.defaultSize! * 7),
                child:  CustomGeneralButtom2(
                  height: 42,

                   text: 'Continue With Facebook',
                  icon: FontAwesomeIcons.facebook,
                  iconcolor: kMainColorPage,
                  textColor: kMainColorPage,
                  boxColor: const Color(0xFF80CBC4),
                  borderColor: kMainColorPage,
                  width: SizeConfig.screenWidth,
                 
                ),
              ),
            ),
              const  SizedBox(
                height: 40,
               )       // Add more widgets as needed for the sign-up form
                      ],
                    ),
            ),
         ),        
         
  );
}

  
  @override
   Widget build(BuildContext context) {
    double aspectRatio = SizeConfig.screenWidth! / SizeConfig.screenHeight!;
    return AspectRatio(
      aspectRatio: aspectRatio,
      child:Scaffold(
        backgroundColor: kMainColorSplash,
      body :Column(
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
       
       const  Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(width: 100,),
    Text(
      'Don\'t have an account? ',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: Color(0xff090f0f),
        fontWeight: FontWeight.w400,
      ),
    ),
   
     
    
  ],
)

          // Add the rest of your widgets here, for example, text fields, buttons, etc.
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        splashColor: kMainColorPage,
        highlightElevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 253),
       
        onPressed:() => showBottomSheet(null),
        child: 
        const Text(
        'SignUp',
        style:  TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15.1,
          color: Color(0xff090f0f),
          fontWeight: FontWeight.w900,
        ),
      ),
      ),
        floatingActionButtonLocation: CustomFloatLocation(),
        
    ),
    );
  }
}