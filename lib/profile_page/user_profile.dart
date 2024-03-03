import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


class ClipTry extends StatelessWidget {
  const ClipTry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEFEF),
      body: Stack(
        children: [
         Positioned(
          top: -400,
          right: -90,
           child: Image.asset(
             "assets/image/Path44.png",
             width:1980.w ,
             height: 2220.h,
             fit: BoxFit.contain, // Adjust the fit as needed
           ),
         ),
           
          
        ],
      )
    );
  }
}
