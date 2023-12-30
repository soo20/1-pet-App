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
import 'package:petapplication/pages/page2/sign_up_body.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});


  @override
  State<LoginBody> createState() => _LoginBodyState();
  
}

class _LoginBodyState extends State<LoginBody> with TickerProviderStateMixin {
  late AnimationController _controller ;
  late Animation _animation ;
  AnimationStatus _status = AnimationStatus.dismissed ; 
  @override
  void initState(){
    super.initState();
    _controller =
    AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0 ,begin: 0.0).animate(_controller)
    ..addListener(() {
      setState(() {
        
      });
    })
    ..addStatusListener((status) {
      _status = status ;
    });
  }
  
  // ignore: non_constant_identifier_names
  void LoginBodyStat(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const SignUpPody(),
    );
  }
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(19),
      borderSide: const BorderSide(width: 1.0, color:  Color.fromARGB(70, 112, 112, 112)));
   bool isCardVisible = false;
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
          
          Flexible(
            flex: 3,
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
            flex: 2,
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
                  vertical: SizeConfig.defaultSize! * 1.2,
                  horizontal: SizeConfig.defaultSize! * 8),
              child: CustomGeneralButtom2(
                height: 42,
                text: 'LOGIN WITH EMAIL',
                
                onTap: () {
                  navigator?.pushAndRemoveUntil(
                      MaterialPageRoute(builder: (e) => const LoginInfo()),(route) => true,);
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
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(width: 115,),
   Text(
      'Don\'t have an account? ',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15.5,
        color: Color(0xff090f0f),
        fontWeight: FontWeight.w400,
      ),
    ),
  ]
          ),
          SizedBox(width: 50,),
    
   Row(
     mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.end,
  mainAxisSize: MainAxisSize.min,
    children:[
    //  Transform(transform: transform)
    CupertinoButton(
      child: Text(
        'Sign Up',
        style:  TextStyle(
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
          builder: (BuildContext builder){
            return CupertinoPopupSurface(
              isSurfacePainted: false,
              
              child:
               Container(
                width: double.infinity,
                height: 430,
    decoration: BoxDecoration(
      color: const Color(0xffeeefef),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(75.0),
        topRight: Radius.circular(75.0),
      ),
      border: Border.all(width: 0.5, color: const Color(0xff707070)),
    ),
    child :Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 214, 64),
    body : Column(
         
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
            text: 'an \n  account',
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
       //button1         
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 1.5,
                    horizontal: SizeConfig.defaultSize! * 6.5),

               child: const CustomGeneralButtom2(
                          height: 42,
                          text: 'Continue With Google',
                          textColor: kMainColorPage,
                          icon: FontAwesomeIcons.google,
                          iconcolor: Color.fromARGB(255, 248, 54, 90),
                          boxColor: kMainColor,
                          borderColor: kMainColor,
                          width: null,
                        )
                     
              ),
            ),
            //button2
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 0.001,
                    horizontal: SizeConfig.defaultSize! * 6.5),
                   
                child: CustomGeneralButtom2(
                          height: 42,
                          text: 'Continue With Email',
                          onTap: () {
                            setState(() {
                              
                            });
                            // Handle the "Continue With Email" button press
                          },
                          textColor: kMainColorPage,
                          icon: FontAwesomeIcons.facebook,
                          iconcolor: kMainColorPage,
                          boxColor: const Color(0xFF80CBC4),
                          borderColor: const Color(0xFF80CBC4),
                          width: null,
                        )
                      
              ),
            ),
            //button3
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 1.4,
                    horizontal: SizeConfig.defaultSize! * 6.5),
                child:  CustomGeneralButtom2(
                          height: 42,
                          text: 'Continue With Email',
                          icon: FontAwesomeIcons.envelope,
                          iconcolor: kMainColorPage,
                          textColor: kMainColorPage,
                         boxColor: const Color.fromARGB(255, 248, 54, 90),
                          borderColor:const Color.fromARGB(255, 248, 54, 90),
                          width: SizeConfig.screenWidth,
                        )
                     
              ),
            ),
              const  SizedBox( height: 40, ) ,   
               // Add more widgets as needed for the sign-up form
                      ],
                    ),
              ),
  )
            );
            
          }
          );
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



