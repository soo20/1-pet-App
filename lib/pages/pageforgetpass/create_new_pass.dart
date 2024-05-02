import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

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
     final Size size = MediaQuery.of(context).size;
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(55.r),
        borderSide: const BorderSide(
            width: 0.4, color: Color.fromARGB(70, 112, 112, 112)));
   // double aspectRatio = screenHeight / screenWidth;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffDCD3D3),
      appBar: AppBar(
        backgroundColor: const Color(0xffDCD3D3),
        elevation: 2,
        toolbarHeight: 230.h,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff4A5E7C),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 35.0,
          padding: const EdgeInsets.only(
              left: 6.0), // Set the size of the arrow icon
        ),
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        foregroundColor: const Color(0xff4A5E7C),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
       
  Padding(
    padding:  EdgeInsets.only(
top: size.height*0.07
    ),
    child: Text(
                'Create New Password',
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 75.sp,
                  color: const Color(0xff4A5E7C),
                  fontWeight: FontWeight.w700,
                ),
              ),
             ),
    
         Padding(
           padding: EdgeInsets.only(
            top: size.height*0.12,
            right: size.width*0.45
           ),
            child: Text(
              'New password',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 60.sp,
                 color: const Color(0xff4A5E7C),
                fontWeight: FontWeight.w700,
                height: 5.h,
              ),
              textHeightBehavior:
                 const TextHeightBehavior(applyHeightToFirstAscent: false
                  ),
              softWrap: false,
            ),
          ),
              Container(
          padding: EdgeInsets.only(
             
              right: size.width*0.1,
              left: size.width*0.1,
            
              ),
          child: TextField(
            obscureText: _obscureText,
           
            style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 50.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w600,
              ),
            decoration: InputDecoration(
               contentPadding:
              EdgeInsets.only(
                left: size.width*0.06,
                top: size.height*0.05
                
               ),
              suffixIcon: IconButton(
                icon: Icon(
                  size: 20,
                  color: const Color.fromARGB(96, 9, 15, 15),
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
              
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
        ),

        Padding(
          padding:EdgeInsets.only(
          top: size.height*0.01,
          right:size.height*0.15,

          ),
       child:  Text(
              ' ! Must be at least 8 characters',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 38.sp,
                color: const Color(0xffA26874),
                fontWeight: FontWeight.w800,
                height: 1.9411764705882353.h,
              ),
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            )
        ),


      
       Padding(
        padding:  EdgeInsets.only(
        top : size.height *0.06,
        //left: size.width *0.08,
        right: size.width *0.35
        ),
       child:  Text(
              'Confirm Password',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 60.sp,
                color: const Color(0xff4A5E7C),
                fontWeight: FontWeight.w700,
                height: 1.9411764705882353.h,
              ),
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            )
        ),



      Container(
          padding:  EdgeInsets.only(
        top : size.height *0.015,
        left: size.width *0.1,
        right: size.width *0.1
             
          ),
            child: TextField(
            obscureText: _obscureText2,
           
            style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 50.sp,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w600,
              ),
            decoration: InputDecoration(
               contentPadding:
                EdgeInsets.only(
                left: size.width*0.06,
                top: size.height*0.05
                
               ),
              suffixIcon: IconButton(
                icon: Icon(
                  size: 20,
                  color: const Color.fromARGB(96, 9, 15, 15),
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
        
        
       
        
      
        
        /*Padding(
            padding: const EdgeInsets.fromLTRB(40.5, 75, 0, 0),
            child: SizedBox.expand(
                child: SvgPicture.string(
              '<svg viewBox="0.0 0.0 332.3 56.8" ><path transform="translate(-634.34, 3069.19)" d="M 634.3416748046875 -3012.3876953125 L 643.8690795898438 -3069.18896484375 L 672.4514770507812 -3034.89404296875 L 920.1640625 -3034.89404296875 L 949.9368896484375 -3069.18896484375 L 966.6100463867188 -3012.3876953125" fill="none" stroke="#081e17" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.contain,
            ))),*/
            SizedBox(
              height: 150.h,
            ),
        CustomGeneralButtom(
          boxColor: const Color(0xffA26874),
          textColor: const Color(0xffFFFFFF),
          height: 130.h,
          width: 350.w,
          customFontSize: 45.sp,
          borderColor: const Color.fromARGB(108, 112, 112, 112),
          text: 'Submit',
          onTap: () {
            Get.to(() => const LoginInfo(), transition: Transition.zoom);
          },
          fontWeight: FontWeight.w800,
        ),
      ]),
    );
  }
}
