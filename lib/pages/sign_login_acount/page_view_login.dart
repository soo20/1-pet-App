import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/pages/sign_login_acount/edit_acount.dart';

class PageViewLogin extends StatefulWidget {
  const PageViewLogin({super.key});

  @override
  State<PageViewLogin> createState() => _PageViewLoginState();
}

class _PageViewLoginState extends State<PageViewLogin> {
  late PageController _pageController;
  TextEditingController myController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(19),
        borderSide: const BorderSide(
            width: 1.0, color: Color.fromARGB(70, 112, 112, 112)));
    //double aspectRatio = screenHeight / screenWidth;
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.only(
            bottom: 150,
            right: 50,
            left: 50,
            //top: screenWidth *0.08
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                    child: CustomGeneralButtom2(
                      height: 115.h,
                      text: 'Continue With Google',
                      textColor: kMainColorPage,
                      icon: FontAwesomeIcons.google,
                      iconcolor: const Color.fromARGB(255, 248, 54, 90),
                      boxColor: kMainColor,
                      borderColor: kMainColor,
                      width: 730.w,
                    )),
              ),

              Flexible(
                flex: 4,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                    child: CustomGeneralButtom2(
                      height: 115.h,
                      text: 'Continue With Facebook',
                      icon: FontAwesomeIcons.facebook,
                      iconcolor: kMainColorPage,
                      textColor: kMainColorPage,
                      boxColor: const Color(0xff80CBC4),
                      borderColor: kMainColorPage,
                      width: 730.w,
                    )),
              ),
              Flexible(
                flex: 4,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                    child: CustomGeneralButtom2(
                      height: 115.h,
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
                      boxColor: const Color(0xffF83658),
                      borderColor: const Color.fromARGB(255, 248, 54, 90),
                      width: 730.w,
                    )),
              ),
              //1

              SizedBox(
                height: 0.h,
              ),

              //page2
            ],
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus(); // Manually dismiss the keyboard
          },
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 50,
                right: 50,
                left: 50,
                //top: screenWidth *0.08
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),

                  TextFormField(
                    expands: false,
                    controller: myController,
                    obscureText: false,
                    onSaved: (newValue) => 2,
                    style: const TextStyle(color: Color(0xff090F0F)),
                    keyboardAppearance: Brightness.light,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        fillColor: const Color(0xFFFFFFFF),
                        filled: true,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 37.sp,
                          color: const Color.fromARGB(116, 19, 79, 92),
                          fontWeight: FontWeight.w800,
                        ),
                        enabledBorder: border,
                        focusedBorder: border,
                        prefixIcon: const Icon(
                          Icons.man_2_outlined,
                          color: Color.fromARGB(116, 19, 79, 92),
                        )),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Color(0xff090F0F)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 37.sp,
                        color: const Color.fromARGB(116, 19, 79, 92),
                        fontWeight: FontWeight.w800,
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color.fromARGB(116, 19, 79, 92),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(color: Color(0xff090F0F)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 37.sp,
                        color: const Color.fromARGB(116, 19, 79, 92),
                        fontWeight: FontWeight.w800,
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: Color.fromARGB(116, 19, 79, 92),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 10),
                      child: CustomGeneralButtom(
                        height: 113.h,
                        text: 'Sign Up',
                        onTap: () {
                          Get.to(() =>  EditAcount(),
                              transition: Transition.zoom);
                        },
                        textColor: kMainColorPage,
                        boxColor: kMainColor,
                        borderColor: const Color(0xff707070),
                        fontWeight: FontWeight.w800,
                        width: 300.w,
                      )),
                  // Add more widgets as needed for the sign-up form
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
