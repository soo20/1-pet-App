// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:petapplication/pages/setting_bage/alart_page.dart';

import 'package:petapplication/pages/setting_bage/help_tips.dart';
import 'package:petapplication/pages/sign_login_acount/loginbody.dart';
import 'package:petapplication/profile_page/edit_acount.dart';

class Setting extends StatelessWidget {
  final BuildContext ccontext;
  const Setting({super.key, required this.ccontext});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEFE6E5),
      appBar: AppBar(
        elevation: 0,

        automaticallyImplyLeading: false,
        //iconTheme: IconThemeData.fallback(),
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 110.h,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            // Add your search action here
          ),
        ],
        iconTheme: const IconThemeData(
          color: Color(0xff707070), // Set the color of the icons
          size: 35.0,

          // Set the size of the icons
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.08, top: size.height * 0.01),
              child: Text(
                'Setting',
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 120.sp,
                  color: const Color(0xff4A5E7C),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
                softWrap: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.035,
                  right: size.width * 0.035,
                  top: size.height * 0.01),
              child: _buildListView(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // Define a list of titles
    List<String> titles = [
      "Edit Profile",
      "Help",
      "Share App",
      "Rate Us",
      "Send Feedback",
      "Log Out"
    ];
    List<IconData> icons = [
      Icons.edit_outlined,
      Icons.help_outline,
      Icons.ios_share,
      Icons.star_outline_outlined,
      Icons.edit_attributes,
      Icons.person_2_rounded,
    ];
    // Define onTap functions
    void editProfile() {
      Get.to(
        () =>
            const EditAcount(), // Replace YourNextPage with the actual class for the next page
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
      );
    }

    void helpT() {
      Get.to(
        () =>
            const HelpTips2(), // Replace YourNextPage with the actual class for the next page
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
      );
    }

    void shareApp() {
      showDialog(
        context: ccontext,
        builder: (context) => Alart1(
            title: 'https://translate.google.com',
            confirmButtonText: 'Copy Link',
            confirmButtonText2: 'Decline',
            customFontSize: 50.sp,
            padding: EdgeInsets.only(top: size.height * 0.05),
            padding2: EdgeInsets.only(top: size.height * 0.02)),
      );
    }

    List<VoidCallback> onTapFunctions = [
      editProfile, // Edit Profile
      helpT,
      shareApp,
      () {
        print("Tapped on Rate Us");
      },

      () {
        print("Tapped on Send Feedback");
      },
    ];
    return SizedBox(
      height: size.height,
      width: size.width,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.006),
            child: Card(
              color: const Color.fromARGB(105, 210, 207, 207),
              semanticContainer: true,
              elevation: 0,
              child: SizedBox(
                height: 67,
                child: ListTile(
                  title: Text(
                    titles[index],
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 67.sp,
                      color: const Color(0xff5D595B),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  leading: Icon(
                    icons[index],
                    size: 35,
                    color: const Color(0xffA26874),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: index == 5
                      ? () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: size.width * 0.01,
                                      sigmaY: size.width * 0.01,
                                    ),
                                    child: AlertDialog(
                                      elevation: 0.0,
                                      backgroundColor: const Color(0xffDCD3D3),
                                      content: Text.rich(
                                        textAlign: TextAlign.center,
                                        TextSpan(
                                          style: TextStyle(
                                            height: 0.0,
                                            fontFamily: 'Cosffira',
                                            fontSize: size.width * 0.047,
                                            fontWeight: FontWeight.w800,
                                            color: const Color(0xff4A5E7C),
                                            letterSpacing: 0.5,
                                          ),
                                          children: const [
                                            TextSpan(
                                              text: "are you sure you want to ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Log out?',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            // Align buttons at the ends
                                            children: [
                                              ElevatedButton(
                                                onPressed: () async {
                                                  try {
                                                    // Sign out from Firebase
                                                    await FirebaseAuth.instance
                                                        .signOut();

                                                    // Sign out from Google
                                                    await GoogleSignIn
                                                            .standard()
                                                        .signOut();
                                                    Get.to(
                                                        () => const LoginBody(),
                                                        transition:
                                                            Transition.zoom);
                                                  } catch (error) {
                                                    print(
                                                        'Error during sign-out: $error');
                                                  }
                                                  //
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xffA26874),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.width * 0.028,
                                                    vertical:
                                                        size.height * 0.025,
                                                  ), // Adjust the padding as needed
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      size.width * 0.092,
                                                    ), // Set the border radius of the button
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    left: size.width * 0.23,
                                                    right: size.width * 0.23,
                                                  ),
                                                  child: Text(
                                                    'yes',
                                                    style: TextStyle(
                                                      height: 0.0,
                                                      fontFamily: 'Cosffira',
                                                      fontSize:
                                                          size.width * 0.045,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                      letterSpacing: 0.5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.015,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xffB5C0D0),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.width * 0.028,
                                                    vertical:
                                                        size.height * 0.025,
                                                  ), // Adjust the padding as needed
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      size.width * 0.092,
                                                    ), // Set the border radius of the button
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    left: size.width * 0.2,
                                                    right: size.width * 0.2,
                                                  ),
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                      height: 0.0,
                                                      fontFamily: 'Cosffira',
                                                      fontSize:
                                                          size.width * 0.045,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                      letterSpacing: 0.5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                        }
                      : onTapFunctions[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
