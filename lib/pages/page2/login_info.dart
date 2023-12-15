import 'package:flutter/material.dart';
import 'package:petapplication/core/utils/size_config.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';


class LoginInfo extends StatefulWidget {
  const LoginInfo({super.key});

  @override
  State<LoginInfo> createState() => _LoginInfoState();
}

class _LoginInfoState extends State<LoginInfo> {
  @override
  Widget build(BuildContext context) {
    double aspectRatio = screenHeight/screenWidth;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 201, 201),
      body: Stack(
        children: [
          Positioned(
            top: 67,
             right: SizeConfig.defaultSize!/0.1,
               width: 350,
            child: AspectRatio(aspectRatio: aspectRatio,
            child: Image.asset(
              'assets/image/Group286.png',
              fit: BoxFit.contain,
            ),
          ),
          ),
          Positioned.fill(
            child: content(),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: SizeConfig.defaultSize! * 55,
        width: screenWidth, // Adjust as needed
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/login.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    //CustomTextFormField(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
