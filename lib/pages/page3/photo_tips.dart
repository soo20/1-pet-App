import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TipsOfPhoto extends StatelessWidget {
  const TipsOfPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEFE6E5),
      appBar: AppBar(
        elevation: 1,

        automaticallyImplyLeading: true,

        //iconTheme: IconThemeData.fallback(),
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 70.h,

        leadingWidth: 60.w,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color.fromARGB(121, 74, 94, 124),
          ),
          onPressed: () {
            Get.back();
          },
          iconSize: 33.0,
          padding: const EdgeInsets.only(
              left: 6.0), // Set the size of the arrow icon
        ),
      ),
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(
                    top: size.height*0.045
                    ),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    ' Pet Photo Tips For \n Precision',
                    style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 85.sp,
                        // Reduce line height (leading)
                        height: 1.1, // Adjust the value as needed
                        // Reduce word spacing
                        wordSpacing: -2, // Adjust the value as needed
                        color: const Color(0xff4A5E7C),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                        decorationColor: const Color(0xff2A606C)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text.rich(
                  TextSpan(
                    text: 'Welcome to Our Pet Classification \n Feature! ',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 55.sp,
                      color: const Color(0xffA26874),
                      fontWeight: FontWeight.w600,
                      // Reduce line height (leading)
                      height: 1.2, // Adjust the value as needed
                      // Reduce word spacing
                      wordSpacing: -2, // Adjust the value as needed
                    ), // Optional custom text style
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              ' For accurate results,\n capturing high-quality images is\n essential. Whether identifying your\n pet\'s type, detecting skin issues, or\n assessing stool conditions, these\n considerations enhance the \n precision of our classification process.', // Use narrow no-break space for better underline alignment
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 52.sp,
                            color: const Color(0xff7D7D7D),
                            fontWeight: FontWeight.w600,
                            // Reduce line height (leading)
                            height: 1.2, // Adjust the value as needed
                            // Reduce word spacing
                            wordSpacing: -3, // Adjust the value as needed
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text.rich(
                  TextSpan(
                    text: '1. Head Focus \n',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 57.sp,
                      color: const Color(0xffA26874),
                      fontWeight: FontWeight.w600,
                      // Reduce line height (leading)
                      height: 1.8, // Adjust the value as needed
                      // Reduce word spacing
                      wordSpacing: -1, // Adjust the value as needed
                    ), // Optional custom text style
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              ' Crucial for type identification, \n focus on your pet\'s head. Clear \n shots of facial features and unique\n markings contribute to accurate \n classification. Use treats or toys to \n engage your pet, capturing  \n captivating headshots for better \n insights', // Use narrow no-break space for better underline alignment
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 52.sp,
                            color: const Color(0xff7D7D7D),
                            fontWeight: FontWeight.w600,
                            // Reduce line height (leading)
                            height: 1.2, // Adjust the value as needed
                            // Reduce word spacing
                            wordSpacing: -3, // Adjust the value as needed
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text.rich(
                  TextSpan(
                    text: '2. Varied Angles \n',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 57.sp,
                      color: const Color(0xffA26874),
                      fontWeight: FontWeight.w600,
                      // Reduce line height (leading)
                      height: 1.5, // Adjust the value as needed
                      // Reduce word spacing
                      wordSpacing: -1, // Adjust the value as needed
                    ), // Optional custom text style
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              ' Capture your pet from different \n angles to provide a comprehensive \n view. Showcase their full body, \n distinctive markings, and unique\n features. Multiple perspectives \n enrich the classification process \n for a holistic understanding.', // Use narrow no-break space for better underline alignment
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 50.sp,
                             color: const Color(0xff7D7D7D),
                            fontWeight: FontWeight.w600,
                            // Reduce line height (leading)
                            height: 1.2, // Adjust the value as needed
                            // Reduce word spacing
                            wordSpacing: -3, // Adjust the value as needed
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 70),
                child: Text.rich(
                  TextSpan(
                    text: '3. Skin Health \n',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 57.sp,
                      color: const Color(0xffA26874),
                      fontWeight: FontWeight.w600,
                      // Reduce line height (leading)
                      height: 1.5, // Adjust the value as needed
                      // Reduce word spacing
                      wordSpacing: -1, // Adjust the value as needed
                    ), // Optional custom text style
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              ' When addressing skin diseases,\n emphasize the head in clear shots \n of affected areas. Adequate lighting \n and minimal shadows assist in \n accurate detection. Zoom in on \n rashes or lesions for detailed \n insights into your pet\'s skin health.',
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 50.sp,
                            color: const Color(0xff7D7D7D),
                            fontWeight: FontWeight.w600,
                            // Reduce line height (leading)
                            height: 1.2, // Adjust the value as needed
                            // Reduce word spacing
                            wordSpacing: -3, // Adjust the value as needed
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
