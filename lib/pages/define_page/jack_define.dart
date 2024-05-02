// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:petapplication/core/utils/widgets/custom_buttom.dart';


import 'package:petapplication/pages/pet_setting_pages/alart2_page.dart';

class JackDefine extends StatelessWidget {
  const JackDefine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFE6E5),
      appBar: AppBar(
        elevation: 1,

        automaticallyImplyLeading: true,

        //iconTheme: IconThemeData.fallback(),
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 45,

        leadingWidth: 50,

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image/jack.png',
            width: 800.w,
            height: 1450.h,
            fit: BoxFit.contain, // Adjust the fit as needed
          ),
           Padding(
                padding: const EdgeInsets.only(bottom: 00),
                child: Row(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
      
                  children: [
                    CustomGeneralButtom3(

                      text: '',
                      boxColor: const Color(0xffA26874),
                      height: 140.h,
                      width: 260.w,
                      textColor: null,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const
                             Alart2(
                              text1: 'allow "yuna app" to access\nyour camera on this device"', 
                              text1buttom: 'While Using This App',
                              text2buttom: 'Cancle',
                              ));
                      },
                    ),
                  ],
                ),
              )
      
      
      
          
        ],
      ),
    );
  }
}

//
