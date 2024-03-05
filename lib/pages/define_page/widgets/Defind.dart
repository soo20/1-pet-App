// ignore_for_file: file_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/pages/define_page/jack_define.dart';
import 'package:petapplication/pages/sign_login_acount/acount.dart';


//import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

class Deefine extends StatelessWidget {
  const Deefine({
    super.key,
  });

  // rest of the code...

  @override
  Widget build(BuildContext context) {
  
return Scaffold(
  backgroundColor:const Color(0xffEEEFEF),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:22,top:30),
            child: SafeArea(
               // Add space to the left
               child: 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,), // Add space to the top
                      Container(
                        width: 555.w,
                        height: 400.h,
                        padding: const EdgeInsets.only(top:0,left:  0,),
                        decoration: BoxDecoration(
                         // color: const Color(0xffEEEFEF), // Box color
                          borderRadius: BorderRadius.circular(60.r),
                          border: Border.all(color: const Color(0xff707070),width: 0.4) // Border radius if needed
                        ),
                        child:  Center(
                          child: Text(
                     overflow: TextOverflow.ellipsis,
            'Let\'s start by defining your \nlovely pet. You can choose \nto define it with Jack, or\n you can manually add your \n pet\'s details.',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 33.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: SvgPicture.string(
                                    _svg_pp2ta,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.contain,
                                     width: 160.w,
                                    height: 150.h,
                        ),
                      ),
SizedBox(height: 850.h, ),
                        Center(
                          //padding: const EdgeInsets.only(left:0),
                          child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                          
                          
                                  children: [
                                
                                  
                                       
                                  
                                  CustomGeneralButtom(
                                    text: 'Define With Jack',
                                    borderColor: const Color(0xff707070),
                                    onTap: () {
                                      navigator?.pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (e) => const JackDefine()),
                                        (route) => true,
                                      );
                                    },
                                    textColor: kMainColor,
                                    boxColor: const Color(0xFFE3B1A8),
                                    height: 125.h,
                                    width: 355.w,
                                    customFontSize: 35.r,
                                  
                                  ),
                                  SizedBox(width: 70.w,),
                                    CustomGeneralButtom(
                                   text: 'Add Manually ',
                                   textColor: const Color(0xFFE3B1A8),
                                   boxColor: kMainColor,
                                   height: 125.h,
                                   width:355.w ,
                                   customFontSize: 35.r,
                                   onTap: () {
                                       navigator?.pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (e) => const Account())  ,
                                        (route) => true,
                                      );
                                    },
                                  
                                   borderColor: const Color(0xff707070),
                                 ),
                                  ],
                                 ),
                        )
                    ],
                  ),
               
            ),
          ),
           Padding(
          padding: const EdgeInsets.fromLTRB(
              195.0,160,0,0), // Add padding of 8.0 to all sides
          child: Image.asset(
            'assets/image/Group786.png',
            width:540.w ,
            height: 1050.h,
            fit: BoxFit.contain, // Adjust the fit as needed
          ),
        ),

     
        
     
        ],
      ),
    );
  }
}
//
const String _svg_pp2ta =
    '<svg viewBox="299.2 364.0 181.2 160.2" ><path transform="translate(-1654.57, 4001.0)" d="M 1953.72900390625 -3637 L 2013.6484375 -3532.818359375 L 2134.880859375 -3476.79736328125 L 2134.880859375 -3476.79736328125 L 2063.813720703125 -3532.818359375 L 2077.748291015625 -3637 L 1953.72900390625 -3637 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
