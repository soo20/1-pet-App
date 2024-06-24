import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petapplication/pages/sign_login_acount/loginbody.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFE6E5),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/image/cloud.png',
                width: 580.w,
                height: 380.h,
              ),
              SizedBox(height: 100.h),
              SizedBox(
                height: 60,
                child: Text(
                  "Please provide your email address to reset your password.",
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 60.sp,
                    color: const Color(0xff354A6B),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        cursorColor: const Color(0xffA26874),
                        controller: emailController,
                        decoration: InputDecoration(
                          hoverColor: const Color(0xffA26874),
                          fillColor: const Color(0xffA26874),
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Color(0xffA26874),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                final email = emailController.text.trim();
                                if (email.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      "Email field cannot be empty.",
                                      style: TextStyle(
                                        fontFamily: 'Cosffira',
                                        fontSize: 20,
                                        color: Color(0xff354A6B),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ));
                                  return;
                                }

                                try {
                                  await FirebaseAuth.instance
                                      .sendPasswordResetEmail(email: email);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      "Password reset email has been sent. Please check your mailbox.",
                                      style: TextStyle(
                                        fontFamily: 'Cosffira',
                                        fontSize: 20,
                                        color: Color(0xffEFE6E5),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginBody()), // Update this line to navigate to the appropriate page
                                  );
                                } catch (error) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Failed to send password reset email: $error",
                                      style: const TextStyle(
                                        fontFamily: 'Cosffira',
                                        fontSize: 20,
                                        color: Color(0xff354A6B),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ));
                                }
                              },
                              focusColor: const Color(0xffA26874),
                              icon: const Icon(
                                Icons.send_rounded,
                                color: Color(0xffA26874),
                              )),
                          hintText: "Email Address",
                          hintStyle: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 50.sp,
                            color: const Color.fromARGB(134, 53, 74, 107),
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xffA26874),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 53, 74, 107),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
