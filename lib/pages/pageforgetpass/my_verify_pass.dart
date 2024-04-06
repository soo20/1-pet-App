// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/pages/pageforgetpass/create_new_pass.dart';
import 'package:pinput/pinput.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({super.key});

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  int resendtime = 120;
  late Timer countertimer;
  bool isTimerRunning = false;
  @override
  void initState() {
    starttimer();
    super.initState();
  }

  void starttimer() {
    countertimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendtime = resendtime - 1;
      });
      if (resendtime < 1) {
        stoptimer();
      }
    });
  }

  void stoptimer() {
    if (countertimer.isActive) {
      countertimer.cancel();
      setState(() {
        isTimerRunning = false;
      });
    }
  }

  String getFormattedTime() {
    int minutes = resendtime ~/ 60;
    int seconds = resendtime % 60;
    return '$minutes:${seconds.toString().padLeft(1, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 100.w,
      height: 160.h,
      textStyle: TextStyle(
          fontSize: 42.sp,
          color: const Color(0xff020202),
          fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 231, 229, 229),
        border: Border.all(color: const Color.fromARGB(88, 112, 112, 112)),
        borderRadius: BorderRadius.circular(30.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: const Color(0xffF7F7F7),
      border: Border.all(
        color: kMainColorSplash,
      ),
      borderRadius: BorderRadius.circular(30.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromARGB(255, 231, 229, 229),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xffF3F2F2),
      extendBodyBehindAppBar: true,
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/cloud.png',
                width: 500.w,
                height: 280.h,
              ),
              SizedBox(
                height: 100.h,
              ),
              Text(
                "Please Enter 5-Digit Code",
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 60.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff020202),
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              RichText(
                text: TextSpan(
                  text: 'We\'ve Sent A Code To ',
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 44.sp,
                    color: const Color.fromARGB(184, 9, 15, 15),
                    fontWeight: FontWeight.w800,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'malk22@gmail.com\n',
                      style: TextStyle(
                        fontSize: 44.sp,
                        color: const Color(0xff548987),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: 'Enter a Code In That Message',
                      style: TextStyle(
                        fontSize: 42.sp,
                        color: const Color.fromARGB(184, 9, 15, 15),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Pinput(
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onCompleted: (pin) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const GreateNewPass()),
                  );
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 660.w),
                  isTimerRunning
                      ? Row(
                          children: [
                            const Icon(
                              Icons.alarm_on,
                              color: Color.fromARGB(255, 108, 42, 50),
                              size: 18,
                            ),
                            SizedBox(width: 0.w),
                            Text(
                              ' ${getFormattedTime()} Min',
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 108, 42, 50),
                              ),
                            ),
                          ],
                        )
                      : InkWell(
                          onTap: () {
                            // resend code
                            setState(() {
                              resendtime = 120;
                              isTimerRunning = true;
                            });
                            starttimer();
                          },
                          child: Text(
                            'Resend',
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 45.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xff2A606C),
                            ),
                          ),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
