import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'dart:async';
import 'package:email_otp/email_otp.dart';
import 'package:petapplication/pages/pageforgetpass/create_new_pass.dart';

class MyVerify extends StatefulWidget {
  final EmailOTP myauth;
  final String email;

  const MyVerify({Key? key, required this.myauth, required this.email})
      : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _countdownTimer;
  int resendtime = 120;
  bool isTimerRunning = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    startTimer();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _countdownTimer.cancel();
    super.dispose();
  }

  void startTimer() {
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendtime > 0) {
        setState(() {
          resendtime--;
        });
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _countdownTimer.cancel();
    setState(() {
      isTimerRunning = false;
    });
  }

  String getFormattedTime() {
    int minutes = resendtime ~/ 60;
    int seconds = resendtime % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 100.w,
      height: 160.h,
      textStyle: TextStyle(
        fontSize: 42.sp,
        color: const Color(0xff020202),
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(20, 128, 121, 121),
        border: Border.all(color: const Color.fromARGB(88, 112, 112, 112)),
        borderRadius: BorderRadius.circular(30.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xffF7F7F7),
        border: Border.all(color: const Color(0xffA26874)),
        borderRadius: BorderRadius.circular(30.r),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xffEFE6E5),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xffEFE6E5),
      extendBodyBehindAppBar: true,
      body: Container(
        margin: EdgeInsets.only(
          left: size.width * 0.07,
          right: size.width * 0.07,
          bottom: size.height * 0.05,
        ),
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
              SizedBox(height: 100.h),
              Text(
                "Please Enter 4-Digit Code",
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 70.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff4A5E7C),
                ),
              ),
              const SizedBox(height: 0),
              RichText(
                text: TextSpan(
                  text: 'We\'ve Sent A Code To ',
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 45.sp,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w800,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.email,
                      style: TextStyle(
                        fontSize: 44.sp,
                        color: const Color(0xffA26874),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: '\nEnter the Code From That Message',
                      style: TextStyle(
                        fontSize: 45.sp,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
              Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onCompleted: (pin) async {
                  if (await widget.myauth.verifyOTP(otp: pin)) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const GreateNewPass()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Incorrect OTP. Please try again.",
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 20,
                            color: Color(0xff354A6B),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isTimerRunning
                      ? Row(
                          children: [
                            const Icon(
                              Icons.alarm_on,
                              color: Color(0xffA26874),
                              size: 20,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              ' ${getFormattedTime()}',
                              style: TextStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffA26874),
                              ),
                            ),
                          ],
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              resendtime = 120;
                              isTimerRunning = true;
                            });
                            startTimer();
                          },
                          child: Text(
                            'Resend',
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 45.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xff4A5E7C),
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
