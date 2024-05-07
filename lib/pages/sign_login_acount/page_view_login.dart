// ignore_for_file: use_build_context_synchronously, duplicate_ignore, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/sign_login_acount/login_info_email_pass.dart';

class PageViewLogin extends StatefulWidget {
  final VoidCallback? toggleContainerVisibility;

  const PageViewLogin({super.key, this.toggleContainerVisibility});

  @override
  State<PageViewLogin> createState() => _PageViewLoginState();
}

class _PageViewLoginState extends State<PageViewLogin> {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'enter your email please';
    } else {
      // Regular expression to validate email format
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      if (!regex.hasMatch(value)) {
        return 'Invalid email';
      }
    }
    return null; // Return null if the email is valid
  }

  late PageController _pageController;
  TextEditingController myController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passward = TextEditingController();
  final _fformKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  registration() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _passward.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(80, 0, 0, 0),
          elevation: 0,
          content: Text(
            'Register has Succeeded',
            style: TextStyle(
              fontFamily: 'Cosffira',
              fontSize: 50.sp,
              color: const Color(0xffEFE6E5),
              fontWeight: FontWeight.w600,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust the radius as needed
          ),
          action: SnackBarAction(
            label: 'Close',
            textColor:
                const Color(0xff4A5E7C), // Set the color of the close icon
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
          behavior: SnackBarBehavior.floating, // Set the behavior to floating
        ),
      );

      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginInfo()));
    } on FirebaseAuthException {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
            width: 1.0, color: Color.fromARGB(70, 112, 112, 112)));
    //double aspectRatio = screenHeight / screenWidth;
    return Column(
      children: [
        SizedBox(height: 20.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100.w,
            ),
            IconButton(
              icon: const Icon(
                Icons.close,
                size: 35,
              ),
              onPressed: () {
                widget
                    .toggleContainerVisibility!(); // Call the callback function
              },
              // Add your search action here
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'Cosffira',
              fontSize: 99.sp,
              color: const Color(0xff354a6b),
              height: 1.0404040404040404,
            ),
            children: const [
              TextSpan(
                text: 'create ',
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
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
          softWrap: false,
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),

                   

                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 11, horizontal: 0),
                        child: CustomGeneralButtom2(
                          height: 140.h,
                          text: 'Continue With Google',
                          textColor: kMainColorPage,
                          icon: FontAwesomeIcons.google,
                          iconcolor: kMainColorPage,
                          boxColor: const Color(0xff4A5E7C),
                          borderColor: const Color(0xff4A5E7C),
                          width: 740.w,
                        )),

                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 0),
                        child: CustomGeneralButtom2(
                          height: 140.h,
                          text: 'Continue With Facebook',
                          icon: FontAwesomeIcons.facebookF,
                          iconcolor: kMainColorPage,
                          textColor: kMainColorPage,
                          boxColor: const Color(0xffB5C0D0),
                          borderColor: const Color(0xffB5C0D0),
                          width: 740.w,
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 0),
                        child: CustomGeneralButtom2(
                          height: 140.h,
                          text: 'Continue with Email',
                          onTap: () {
                            if (_pageController.page! < 1) {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn);
                            }
                          },
                          textColor: kMainColorPage,
                          icon: FontAwesomeIcons.envelope,
                          iconcolor: kMainColorPage,
                          boxColor: const Color(0xffA26874),
                          borderColor: const Color(0xffA26874),
                          width: 740.w,
                        )),
                    //1

                    SizedBox(
                      height: 0.h,
                    ),

                    //page2
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 40, left: 40, top: 10, bottom: 0),
                child: Form(
                  key: _fformKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),

                        TextFormField(
                          expands: false,
                          controller: myController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'please Enter your name';
                            }
                            return null;
                          },
                          obscureText: false,
                          onSaved: (newValue) => 2,
                          style: const TextStyle(color: Color(0xff090F0F)),
                          keyboardAppearance: Brightness.light,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              fillColor: const Color(0xFFFFFFFF),
                              filled: true,
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                fontFamily: 'Cosffira',
                                fontSize: 50.sp,
                                color: const Color.fromARGB(73, 19, 79, 92),
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: border,
                              focusedBorder: border,
                              prefixIcon: const Icon(
                                Icons.person_2_rounded,
                                color: Color.fromARGB(73, 19, 79, 92),
                              )),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        TextFormField(
                          controller: _email,
                          validator: validateEmail,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Color(0xff090F0F)),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            fillColor: const Color(0xFFFFFFFF),
                            filled: true,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 37.sp,
                              color: const Color.fromARGB(73, 19, 79, 92),
                              fontWeight: FontWeight.w800,
                            ),
                            enabledBorder: border,
                            focusedBorder: border,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color.fromARGB(73, 19, 79, 92),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10.h,
                        ),

                        TextFormField(
                          controller: _passward,
                          validator: PasswordValidator.validate,
                          obscureText: true,
                          style: const TextStyle(color: Color(0xff090F0F)),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            fillColor: const Color(0xFFFFFFFF),
                            filled: true,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 37.sp,
                              color: const Color.fromARGB(73, 19, 79, 92),
                              fontWeight: FontWeight.w800,
                            ),
                            enabledBorder: border,
                            focusedBorder: border,
                            prefixIcon: const Icon(
                              Icons.vpn_key,
                              color: Color.fromARGB(73, 19, 79, 92),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 0.h,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: CustomGeneralButtom(
                              height: 130.h,
                              text: 'Sign Up',
                              customFontSize: 50.sp,
                              onTap: () {
                                if (_fformKey.currentState!.validate()) {
                                  registration();
                                }
                              },
                              textColor: kMainColorPage,
                              boxColor: const Color(0xffA26874),
                              borderColor: const Color(0xff707070),
                              fontWeight: FontWeight.w800,
                              width: 350.w,
                            )),
                        // Add more widgets as needed for the sign-up form
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }
    return null;

    // Return null if password is valid
  }
}
