// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:petapplication/pages/define_page/widgets/alart_dialog.dart';

class JackDefine extends StatelessWidget {
  const JackDefine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColorPage,
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
            color: Color(0xff2A606C),
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 0),
            child: SafeArea(
              // Add space to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Container(
                    width: 550.w,
                    height: 350.h,
                    padding: const EdgeInsets.only(
                      top: 0,
                      left: 0,
                    ),
                    decoration: BoxDecoration(
                        // color: const Color(0xffEEEFEF), // Box color
                        borderRadius: BorderRadius.circular(60.r),
                        border: Border.all(
                            color: const Color(0xff707070),
                            width: 0.4) // Border radius if needed
                        ),
                    child: Center(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        'hello, my friend, please \ntake a photo of your pet \n to provide some\ninformation about it',
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 36.sp,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 125),
                    child: SvgPicture.string(
                      _svg_pp2ta,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.contain,
                      width: 150.w,
                      height: 130.h,
                    ),
                  ),

                 
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    100, 185, 0, 0), // Add padding of 8.0 to all sides
                child: Image.asset(
                  'assets/image/Group1340.png',
                  width: 640.w,
                  height: 1050.h,
                  fit: BoxFit.contain, // Adjust the fit as needed
                ),
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
                          boxColor: kMainColor,
                          height: 140.h,
                          width: 260.w,
                          textColor: null,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => const AlartDialogPage());
                          },
                        ),
                      ],
                    ),
                  )



              
            ],
          ),
        ], 
      ),
    );
  }
}

//
const String _svg_pp2ta =
    '<svg viewBox="299.2 364.0 181.2 160.2" ><path transform="translate(-1654.57, 4001.0)" d="M 1953.72900390625 -3637 L 2013.6484375 -3532.818359375 L 2134.880859375 -3476.79736328125 L 2134.880859375 -3476.79736328125 L 2063.813720703125 -3532.818359375 L 2077.748291015625 -3637 L 1953.72900390625 -3637 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
