// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';


import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:pinput/pinput.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({super.key});

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  int resendtime = 120 ;
  late Timer counertimer ;
  void initstate(){
    starttimer();
    super.initState();
  }
  starttimer(){
    counertimer = Timer.periodic(const Duration(seconds: 1), (timer) { 
      setState(() {
        resendtime = resendtime - 1 ;
      });
  if(resendtime < 1){
    counertimer.cancel();
  }
    });
  }
  stoptimer(){
    if(counertimer.isActive){
    counertimer.cancel();
  }
  }
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 40,
      height: 65,
      textStyle: const TextStyle(
          fontSize: 20,
          color:   Color(0xff548987),
          fontWeight: FontWeight.w400),
      decoration: BoxDecoration(
       color:const Color.fromARGB(255, 231, 229, 229) ,
        border: Border.all(color: const Color.fromARGB(88, 112, 112, 112)),
        borderRadius: BorderRadius.circular(13),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color:const Color(0xffF7F7F7) ,
      border: Border.all(color: kMainColorSplash,),
      borderRadius: BorderRadius.circular(13),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
         color:const Color.fromARGB(255, 231, 229, 229) ,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
     
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25,),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/cloud.png',
                width: 170,
                height: 170,
              ),
             const  SizedBox(
                height: 5,
              ),
              const Text(
                "Please Enter 5-Digit Code",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700,color:  Color(0xff020202),),
              ),
              const SizedBox(
                height: 0,
              ),
              RichText(
            text: const TextSpan(
              text: 'We\'ve Sent A Code To',
              style: TextStyle(
               
                fontSize: 13,
                color: Color.fromARGB(184, 9, 15, 15),
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Malk22@gmail.com\n',
                  style: TextStyle(
                    
                    fontSize: 14.4,
                    color: Color(0xff548987),
                    fontWeight: FontWeight.w900,
                  ),
                  
                ),
                TextSpan(
                  text: 'Enter a Code In That Message',
                  style: TextStyle(
                   
                    fontSize: 13,
                      color: Color.fromARGB(184, 9, 15, 15),
                    fontWeight: FontWeight.w600,
                  ),
                  
                ),
              ],
            ),
          ),
              const SizedBox(
                height: 30,
              ),
              Pinput(
                length: 5,
                 defaultPinTheme: defaultPinTheme,
                 focusedPinTheme: focusedPinTheme,
                 submittedPinTheme: submittedPinTheme,

                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              const SizedBox(
                height: 10,
              ),
             
              Row(
               
                children: [
                   const SizedBox(width: 260,),
                  
                      resendtime == 0 ? InkWell(
                        onTap: () {
                          // resend code
                        },
                        child: const Text('Resend',  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900,color: Color(0xff2A606C)),),):const SizedBox(),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}