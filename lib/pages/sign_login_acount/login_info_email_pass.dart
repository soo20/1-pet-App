import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/pages/homepage/home.dart';
import 'package:petapplication/pages/pageforgetpass/my_verify_pass.dart';
//import 'package:flutter_svg/svg.dart';

class LoginInfo extends StatefulWidget {
  const LoginInfo({super.key});

  @override
  State<LoginInfo> createState() => _LoginInfoState();
}

class _LoginInfoState extends State<LoginInfo> {
  bool _obscureText3 = true;
  @override
  Widget build(BuildContext context) {
   // double aspectRatio = screenHeight / screenWidth;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 206, 201, 201),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 40,
        foregroundColor: kMainColor,
         leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: kMainColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 39.0,
          padding: const EdgeInsets.only(
              left: 6.0), // Set the size of the arrow icon
        ),
      ),
      extendBodyBehindAppBar: true,
      body:  Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(60.0,50,80,200),
            child: Container(
                              width: 440.w,
                              height: 512.h,
                              
                              decoration: BoxDecoration(
                                border: Border.all(width: 4,color:Colors.transparent ),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2.r,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.2)
                    
                                  )
                                ],
                                shape: BoxShape.circle,
                                image: const DecorationImage
                                (fit: BoxFit.contain,
                                  image: AssetImage('assets/image/Group286.png'
                                  ,)
                                   )
                              ),
                            
                              ),
          ),
          Positioned(child: content())
        ],
      ),
    );
  }

  Widget content() {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: const BorderSide(
            width: 0.5, color: Color.fromARGB(70, 112, 112, 112)));

    return Padding(
      padding: const EdgeInsets.only(top :135),
      child: Container(
       
           height:1550.h ,
           width: 1080.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/login.png',),
                fit: BoxFit.fill
                )
            ),
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Colors.transparent, boxShadow: [
                BoxShadow(
                    blurRadius: 120.r,
                    spreadRadius: 10.r,
                  // offset: const Offset(0, 10),
                    color: Colors.grey.withOpacity(0.2))
              ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35,170,35,20),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  style: const TextStyle(color: Color(0xff090F0F)),
                  decoration: InputDecoration(
                     contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                      hintText: 'Email',
                      hintStyle:  TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 35.sp,
                        color: const Color.fromARGB(116, 19, 79, 92),
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color.fromARGB(116, 19, 79, 92),
                      )),
                ),
              ),
            ),
           SizedBox(
              height: 0.h,
            ),
            Container(
              decoration:
                  BoxDecoration(color: Colors.transparent, boxShadow: [
                BoxShadow(
                    blurRadius: 100,
                    spreadRadius: 7.r,
                    offset: const Offset(1, 10),
                    color: Colors.grey.withOpacity(0.2))
              ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35,0,35,0),
                child: TextField(
                  obscureText: _obscureText3,
                  controller: passController,
                  // obscureText: true,
                  style: const TextStyle(color: Color(0xff090F0F)),
                  decoration: InputDecoration(
                     contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText3
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color.fromARGB(116, 19, 79, 92),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText3 = !_obscureText3;
                        });
                      },
                    ),
                    fillColor: const Color(0xFFFFFFFF),
                    filled: true,
                    hintText: 'Password',
                    hintStyle:  TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 35.sp,
                      color: const Color.fromARGB(116, 19, 79, 92),
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: border,
                    focusedBorder: border,
                    prefixIcon: const Icon(
                      Icons.vpn_key,
                      color: Color.fromARGB(116, 19, 79, 92),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height:90.h,
              width: 0,
            ),
            CustomGeneralButtom(
              boxColor: const Color(0xff134F5C),
              textColor: const Color(0xffFFFFFF),
              height: 140.h,
              width: 350.w,
              text: 'Log in',
              borderColor: const Color(0xff707070),
              fontWeight: FontWeight.w700,
              onTap: () {
        Get.to(() => const HomePage(), transition: Transition.zoom);
      },
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height:120.h,
                    width: 40.w,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Forget Your Password? ',
                      style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 40.sp,
                        color: const Color(0xff090f0f),
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'click here',
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 40.sp,
                            color: const Color(0xffF83658),
                            fontWeight: FontWeight.w800,
                          ),
                          // Add onTap callback to navigate to the next page
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyVerify()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
