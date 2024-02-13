// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petapplication/core/utils/size_config.dart';

import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/pages/pageforgetpass/greate_new_pass.dart';
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
      width: 40,
      height: 65,
      textStyle: const TextStyle(
          fontSize: 22, color: Color(0xff020202), fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 231, 229, 229),
        border: Border.all(color: const Color.fromARGB(88, 112, 112, 112)),
        borderRadius: BorderRadius.circular(13),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: const Color(0xffF7F7F7),
      border: Border.all(
        color: kMainColorSplash,
      ),
      borderRadius: BorderRadius.circular(13),
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
        margin:
            EdgeInsets.only(left: 25, right: 25, bottom: screenHeight * 0.015),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/cloud.png',
                width: 180,
                height: 150,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Please Enter 5-Digit Code",
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 29,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff020202),
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              RichText(
                text: const TextSpan(
                  text: 'We\'ve Sent A Code To ',
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 16,
                    color: Color.fromARGB(184, 9, 15, 15),
                    fontWeight: FontWeight.w800,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Malk22@gmail.com\n',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff548987),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: 'Enter a Code In That Message',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(184, 9, 15, 15),
                        fontWeight: FontWeight.w800,
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
                onCompleted: (pin) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const GreateNewPass()),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 260),
                  isTimerRunning
                      ? Row(
                          children: [
                            const Icon(
                              Icons.alarm_on,
                              color: Color.fromARGB(255, 108, 42, 50),
                              size: 18,
                            ),
                            const SizedBox(width: 0),
                            Text(
                              ' ${getFormattedTime()} Min',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 108, 42, 50),
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
                          child: const Text(
                            'Resend',
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff2A606C),
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
