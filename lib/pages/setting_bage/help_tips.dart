import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpTips2 extends StatelessWidget {
  const HelpTips2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDCD3D3),
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        foregroundColor: const Color.fromARGB(255, 108, 107, 107),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff5D595B),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 39.0,
          padding: const EdgeInsets.only(left: 6.0),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    ' YUNA PET APPLICATION\n HELP PAGE',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 100.sp,
                      height: 1.1,
                      wordSpacing: -2,
                      color: const Color(0xff354A6B),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                      decorationColor: const Color(0xff354A6B),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text.rich(
                  TextSpan(
                    text: 'INTRODUCTION\n',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 80.sp,
                      color: const Color(0xffA26874),
                      fontWeight: FontWeight.w600,
                      // Reduce line height (leading)
                      height: 2.5,
                      // Reduce word spacing
                      wordSpacing: 5,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Yuna is a revolutionary mobile application designed\n'
                              'to be your trusted companion in ensuring the well\n'
                              'being of your pets. Utilizing cutting-edge image\n'
                              'classification technology, Yuna can identify your\n'
                              'pet\'s type and assess for skin or fecal diseases\n'
                              'through image analysis. Additionally, Yuna features\n'
                              'a robust reminder system to help you manage\n'
                              'important events in your pet\'s life.', // Use narrow no-break space for better underline alignment
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 48.sp,
                            color: const Color(0xff080808),
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            wordSpacing: 0,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text.rich(
                  TextSpan(
                    text: 'TABLE OF CONTENTS\n',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 85.sp,
                      color: const Color(0xffA26874),
                      fontWeight: FontWeight.w600,
                      height: 2.5,
                      wordSpacing: -1,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Getting Started\n',
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 70.sp,
                            color: const Color(0xff6E84A7),
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            wordSpacing: -3,
                          )),
                      TextSpan(
                          text: 
                          '1.1  Installation\n'
                          '1.2  Account Creation\n'
                          '1.3  Permissions'
                              ,
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 47.sp,
                            color: const Color(0xff080808),
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            wordSpacing: -3,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text.rich(
                  TextSpan(
                    text: 'image Classification\n',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                       fontSize: 70.sp,
                            color: const Color(0xff6E84A7),
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      wordSpacing: -1,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                          '2.1  Identifying Reminders\n'
                          '2.2  Detecting Skin Diseases\n'
                          '2.3  Detecting Fecal Diseases'
                          ,
                             style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 47.sp,
                            color: const Color(0xff080808),
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            wordSpacing: -3,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text.rich(
                  TextSpan(
                    text: 'Remider System \n',
                    style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 70.sp,
                            color: const Color(0xff6E84A7),
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            wordSpacing: -3,
                          ),
                    children: <TextSpan>[
                     TextSpan(
                          text:
                          '3.1  Adding Events\n'
                          '3.2  Setting Reminder\n'
                          '3.3  Editing and Deleting Events'
                          ,
                             style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 47.sp,
                            color: const Color(0xff080808),
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            wordSpacing: -3,
                          )),
                    ],
                  ),
                ),
              ),
               SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,),
                child: Text.rich(
                  TextSpan(
                    text: 'Troubleshooting \n',
                    style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize:70.sp,
                            color: const Color(0xff6E84A7),
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            wordSpacing: -3,
                          ),
                    children: <TextSpan>[
                     TextSpan(
                          text:
                          '4.1  App Crashes Or Freezes\n'
                          '4.2  Image Classification Issues\n'
                          '4.3  Reminder Notifications Not Received'
                          ,
                             style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 47.sp,
                            color: const Color(0xff080808),
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            wordSpacing: -3,
                          )),
                    ],
                  ),
                ),
              ),
               SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 50),
                child: Text.rich(
                  TextSpan(
                    text: 'FAQs\n',
                    style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 70.sp,
                            color: const Color(0xff6E84A7),
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            wordSpacing: -3,
                          ),
                    children: <TextSpan>[
                     TextSpan(
                          text:
                          '5.1  What Types of Pets does Yuna Support ?\n'
                          '5.2  Is my Pet\'s Health Information Stored Securely ?\n'
                          '5.3  How Accurate is The Image Classification for Detecting Diseases ?'
                          ,
                             style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 45.sp,
                            color: const Color(0xff080808),
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            wordSpacing: -3,
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
