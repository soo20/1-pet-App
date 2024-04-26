// ignore_for_file: unused_element

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import 'package:petapplication/core/utils/widgets/custom_buttom.dart';


import 'package:petapplication/pages/setting_bage/setting.dart';


//import 'package:petapplication/pages/sign_login_acount/popup_surface.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);
  bool isEmail(String input) => EmailValidator.validate(input);


  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB5C0D0),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 110.h,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/trash.svg', width: 120.w),
            onPressed: () {
              nameController.clear();
              emailController.clear();
              phoneNumberController.clear();
            },
          ),
        ],
        iconTheme: const IconThemeData(
          color: Color(0xff707070),
          size: 50.0,
        ),
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: 35),
        width: 500,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/background_ofedit_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            // SizedBox(height: 0,),
        
            Padding(
              padding: const EdgeInsets.only(top: 0, right: 150),
              child: Container(
                width: 95,
                height: 95,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/Group998.png'))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 65, top: 70, right: 6),
                  child: Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 0.1,
                        color: const Color(0xff707070),
                      ),
                      color: const Color(0xffA26874),
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.only(right: 10),
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        //size: 21,
                        color: const Color(0xffEEEEEE),
                        shadows: [
                          BoxShadow(
                            spreadRadius: 15,
                            blurRadius: 20,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 10, left: 10),
              child: content(context),
            )
          ],
        ),
      ),
    );
  }
bool hasOtherErrors = false; 
  Widget content(BuildContext context) {
   

    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.r),
        borderSide: const BorderSide(
            width: 0.5, color: Color.fromARGB(70, 112, 112, 112)));

    return Column(
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'Cosffira',
              fontSize: 115.sp,
              color: const Color(0xff354A6B),
              height: .970873786407767.h,
            ),
            children: const [
              TextSpan(
                text: 'My ',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'account',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
        ),
        SizedBox(
          height: 110.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Form(

            child: TextFormField(
                
              controller: nameController,
               
              keyboardType: TextInputType.name,
            keyboardAppearance: Brightness.dark,
              obscureText: false,
              style: const TextStyle(color: Color(0xff090F0F)),
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFFFF),
                contentPadding: const EdgeInsets.symmetric(vertical: 19),
                filled: true,
                hintText: 'Name',
                hintStyle: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 48.sp,
                  color: const Color.fromARGB(116, 19, 79, 92),
                  fontWeight: FontWeight.w800,
                ),
                enabledBorder: border,
                focusedBorder: border,
                prefixIcon: const Icon(
                  Icons.man_sharp,
                  color: Color.fromARGB(116, 19, 79, 92),
                ),
              ),
              
             
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 18),
          child: Form(
             autovalidateMode: AutovalidateMode.always,
            child: TextFormField(
              controller: emailController,
              validator: validateEmail,
              
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              style: const TextStyle(color: Color(0xff090F0F)),
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFFFF),
                contentPadding: const EdgeInsets.symmetric(vertical: 19),
                filled: true,
                hintText: 'Email',
                hintStyle: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 48.sp,
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18, left: 35, right: 35),
          child: TextFormField(
            controller: phoneNumberController,
            keyboardType: TextInputType.number,
            obscureText: false,
            style: const TextStyle(color: Color(0xff090F0F)),
            decoration: InputDecoration(
              fillColor: const Color(0xFFFFFFFF),
              contentPadding: const EdgeInsets.symmetric(vertical: 19),
              filled: true,
              hintText: 'Phone Number',
              hintStyle: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 48.sp,
                color: const Color.fromARGB(116, 19, 79, 92),
                fontWeight: FontWeight.w800,
              ),
              enabledBorder: border,
              focusedBorder: border,
              prefixIcon: const Icon(
                Icons.phone,
                color: Color.fromARGB(116, 19, 79, 92),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 200.h,
          width: 0,
        ),
        CustomGeneralButtom(
          boxColor: const Color(0xffA26874),
          textColor: const Color(0xffFFFFFF),
          height: 140.h,
          width: 350.w,
          customFontSize: 48.sp,
          borderColor: const Color.fromARGB(60, 112, 112, 112),
          text: 'Finish',
          onTap: () {
          Get.to(()=>
                Setting(
                  ccontext: context,
                ),
                transition: Transition.zoom,
              );

          },
          fontWeight: FontWeight.w800,
        ),
      ],
    );
  }
}
