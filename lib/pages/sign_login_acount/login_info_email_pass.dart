// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';
import 'package:petapplication/pages/pageforgetpass/emailvierfiy.dart';

//import 'package:flutter_svg/svg.dart';

class TheMainLoginPage extends StatefulWidget {
  const TheMainLoginPage({super.key});

  @override
  State<TheMainLoginPage> createState() => _TheMainLoginPageState();
}

bool isloading = false;

class _TheMainLoginPageState extends State<TheMainLoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  @override
  void dispose() {
    _email.dispose;
    _pass.dispose();
    super.dispose();
  }

  @override
  void initState() {
    isloading = false;
    super.initState();
  }

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
    //Ssoo@121
    return null; // Return null if the email is valid
  }

  Future<void> checkAuthentication() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is already logged in, navigate to main homepage
      Get.offAll(() => const TheMainHomePage());
    }
  }

  // login function
  void signInWithEmailAndPassword() async {
    String errorMessage = 'Login Successed';
    try {
      setState(() {
        isloading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _pass.text,
      );

      // Navigate to the main homepage upon successful login
      await checkAuthentication();

      ScaffoldMessenger.of(context).clearSnackBars();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(80, 0, 0, 0),
          elevation: 0,
          content: Text(
            errorMessage,
            style: TextStyle(
              fontFamily: 'Cosffira',
              fontSize: 50.sp,
              color: const Color(0xffEFE6E5),
              fontWeight: FontWeight.w600,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          action: SnackBarAction(
            label: 'Welcome',
            textColor: const Color(0xff4A5E7C),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });

      if (e.code == 'user-not-found') {
        errorMessage = 'Wrong email';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password';
      } else if (e.code == 'network-request-failed') {
        errorMessage = 'You are offline, check your connection';
      } else {
        errorMessage = 'Incorrect email or password, please try again';
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 1,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hitTestBehavior: HitTestBehavior.translucent,
          content: Text(
            errorMessage,
            style: TextStyle(
              fontFamily: 'Cosffira',
              fontSize: 50.sp,
              color: const Color(0xffEFE6E5),
              fontWeight: FontWeight.w600,
            ),
          ),
          action: SnackBarAction(
            label: 'Close',
            textColor: const Color(0xff4A5E7C),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }
  }

  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    try {
      // Re-authenticate the user to ensure security (optional but recommended)
      User user = FirebaseAuth.instance.currentUser!;
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);

      // Update the password
      await user.updatePassword(newPassword);

      // Password updated successfully
      // You can navigate back to the login page or handle it based on your UI flow
      // For example:
      Navigator.of(context).pop(); // Close the change password screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password updated successfully!'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors such as invalid password, network issues, etc.
      print('Failed to update password: ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update password: ${e.message}'),
        ),
      );
    }
  }

  bool _obscureText3 = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 206, 201, 201),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color.fromARGB(255, 108, 107, 107),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff354A6B),
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
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: height * 0.048, right: 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/image/login.png',
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, height * 0.01, width * 0.33, 00),
              child: Container(
                width: width * 0.51,
                height: width * 0.51,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/Group286.png'),
                  ),
                ),
              ),
            ),
            content()
          ],
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget content() {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: const BorderSide(
            width: 0.5, color: Color.fromARGB(70, 112, 112, 112)));

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 60, 35, 0),
              child: TextFormField(
                validator: validateEmail,
                controller: _email,
                obscureText: false,
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 50.sp,
                  color: const Color(0xff354A6B),
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    fillColor: const Color(0xFFFFFFFF),
                    filled: true,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 50.sp,
                      color: const Color(0xffB5C0D0),
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: border,
                    focusedBorder: border,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xffB5C0D0),
                    )),
              ),
            ),
            SizedBox(
              height: 0.h,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 15, 35, 0),
              child: TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'please Enter Password';
                  }
                  return null;
                },
                obscureText: _obscureText3,
                controller: _pass,
                // obscureText: true,
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 50.sp,
                  color: const Color(0xff354A6B),
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText3
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xffB5C0D0),
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
                  hintStyle: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 50.sp,
                    color: const Color(0xffB5C0D0),
                    fontWeight: FontWeight.w600,
                  ),
                  enabledBorder: border,
                  focusedBorder: border,
                  // suffixText: "soha",
                  prefixIcon: const Icon(
                    Icons.vpn_key,
                    color: Color(0xffB5C0D0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150.h,
              width: 0,
            ),
            isloading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      CustomGeneralButtom(
                        boxColor: const Color(0xff354A6B),
                        textColor: const Color(0xffFFFFFF),
                        height: 150.h,
                        width: 400.w,
                        customFontSize: 55.sp,
                        text: 'Log in',
                        borderColor: const Color(0xff707070),
                        fontWeight: FontWeight.w700,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            signInWithEmailAndPassword();
                            _email.clear();
                            _pass.clear();
                            // Get.to(() => const TheMainHomePage(), transition: Transition.zoom);
                          }

                          //
                        },
                      ),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 130.h,
                              width: 0.w,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Forget Your Password? ',
                                style: TextStyle(
                                  fontFamily: 'Cosffira',
                                  fontSize: 45.sp,
                                  color: const Color(0xff090f0f),
                                  fontWeight: FontWeight.w400,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'click here',
                                    style: TextStyle(
                                      fontFamily: 'Cosffira',
                                      fontSize: 45.sp,
                                      color: const Color(0xffA26874),
                                      fontWeight: FontWeight.w800,
                                    ),
                                    // Add onTap callback to navigate to the next page
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EmailVerify()),
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
          ],
        ),
      ),
    );
  }
}
