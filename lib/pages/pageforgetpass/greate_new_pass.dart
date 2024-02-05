import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/sign_login_acount/login_info_email_pass.dart';

class GreateNewPass extends StatefulWidget {
  const GreateNewPass({super.key});

  @override
  State<GreateNewPass> createState() => _GreateNewPassState();
}

class _GreateNewPassState extends State<GreateNewPass> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  
  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
            width: 1.0, color: Color.fromARGB(70, 112, 112, 112)));
    double aspectRatio = screenHeight / screenWidth;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF3F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xffF3F2F2),
        elevation: 2,
        toolbarHeight: 107,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff105952),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 40.0,
          padding: const EdgeInsets.only(
              left: 6.0), // Set the size of the arrow icon
        ),
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        foregroundColor: const Color(0xff105952),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Positioned(
          top: 57,
          left: SizeConfig.defaultSize! / 0.15,
          width: 350,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: const Text(
              'Create New Password',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 30,
                color: Color(0xff105952),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Positioned(
            top: screenHeight * 0.095,
            right: screenWidth * 0.22,
            child: const Text(
              'New password',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 20,
                color: Color(0xfa134f5c),
                fontWeight: FontWeight.w700,
                height: 1.9411764705882353,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            )),
        Positioned(
            top: screenHeight * 0.148,
            right: screenWidth * 0.145,
            child: const Text(
              'Must be at least 8 characters',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 14,
                color: Color(0xff50B1AF),
                fontWeight: FontWeight.w800,
                height: 1.9411764705882353,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            )),
        Container(
          padding: EdgeInsets.only(
              top: screenHeight * 0.112,
              right: screenWidth * 0.045,
              left: screenWidth * 0.045,
              bottom: screenHeight * 0.2),
          child: TextField(
            obscureText: _obscureText,
           
            style: const TextStyle(color: Color(0xff090F0F)),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  //color: ,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              fillColor: const Color(0xFFFFFFFF),
              filled: true,
              hintStyle: const TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 14,
                color: Color.fromARGB(116, 19, 79, 92),
                fontWeight: FontWeight.w600,
              ),
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
        ),
        Positioned(
            top: screenHeight * 0.172,
            right: screenWidth * 0.18,
            child: const Text(
              'Confirm Password',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 21,
                color: Color(0xfa134f5c),
                fontWeight: FontWeight.w700,
                height: 1.9411764705882353,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            )),
        Container(
          padding: EdgeInsets.only(
              top: screenHeight * 0.189,
              right: screenWidth * 0.045,
              left: screenWidth * 0.045,
              bottom: screenHeight * 0.1),
            child: TextField(
            obscureText: _obscureText2,
           
            style: const TextStyle(color: Color(0xff090F0F)),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText2
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  //color: ,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText2 = !_obscureText2;
                  });
                },
              ),
              fillColor: const Color(0xFFFFFFFF),
              filled: true,
              hintStyle: const TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 14,
                color: Color.fromARGB(116, 19, 79, 92),
                fontWeight: FontWeight.w600,
              ),
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(140.5, 455, 140.5, 227.0),
            child: SizedBox.expand(
                child: SvgPicture.string(
              '<svg viewBox="0.0 0.0 332.3 56.8" ><path transform="translate(-634.34, 3069.19)" d="M 634.3416748046875 -3012.3876953125 L 643.8690795898438 -3069.18896484375 L 672.4514770507812 -3034.89404296875 L 920.1640625 -3034.89404296875 L 949.9368896484375 -3069.18896484375 L 966.6100463867188 -3012.3876953125" fill="none" stroke="#081e17" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.contain,
            ))),
        Positioned(
          top: screenHeight * 0.245,
          right: screenWidth * 0.13,
          child: CustomGeneralButtom(
            boxColor: const Color(0xffF83658),
            textColor: const Color(0xffFFFFFF),
            height: screenHeight * 0.025,
            width: SizeConfig.defaultSize! * 13,
            borderColor: const Color.fromARGB(108, 112, 112, 112),
            text: 'Submit',
            onTap: () {
              Get.to(() => const LoginInfo(), transition: Transition.zoom);
            },
            fontWeight: FontWeight.w900,
          ),
        ),
      ]),
    );
  }
}
