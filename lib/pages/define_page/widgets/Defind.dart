// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:petapplication/Welcome/presention/widgets/speaks_of_wanda_jack_yuna_gizmo.dart';

import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/define_page/jack_define.dart';

//import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

class Deefine extends StatelessWidget {
  const Deefine({
    super.key,
  });

  // rest of the code...

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Color(0xffEEEFEF),
      body: Column(
        children: [
          //SizedBox(height: 20.h,),
          // YunaDefine(),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              200.50,150,0,0), // Add padding of 8.0 to all sides
          child: Image.asset(
            'assets/image/Group786.png',
            width:500.w ,
            height: 1000.h,
            fit: BoxFit.contain, // Adjust the fit as needed
          ),
        ),
     
       SizedBox(height: 120.h),
       Row(
        mainAxisSize: MainAxisSize.min,
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
          height: 115.h,
          width: 340.w,
          customFontSize: 28.r,
          //fontWeight: FontWeight.w700,
        ),
        SizedBox(width: 70.w,),
          CustomGeneralButtom(
         text: 'Add Manually ',
         textColor: const Color(0xFFE3B1A8),
         boxColor: kMainColor,
         height: 115.h,
         width:340.w ,
         customFontSize: 30.r,
        
         //fontWeight: FontWeight.w700,
         borderColor: const Color(0xff707070),
       ),
        ],
       )
      ]),
    );
  }
}
//