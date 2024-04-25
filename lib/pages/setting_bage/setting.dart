// ignore_for_file: avoid_print

import 'dart:js';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petapplication/pages/setting_bage/alart_page.dart';
import 'package:petapplication/pages/setting_bage/help_tips.dart';

import 'package:petapplication/pages/sign_login_acount/acount.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 0),
            child: Text(
              'Setting',
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: 50,
                color: Color(0xff4A5E7C),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
              softWrap: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
            child: _buildListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
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
      Icons.edit,
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
            const Account(), // Replace YourNextPage with the actual class for the next page
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
   /* void shareApp() {
      Get.to(
        () =>
            showDialog(
                                context: context,
                                builder: (context) => const Alart1());
      );
    }*/
    void logOut() {
      Get.to(
        () =>
            const HelpTips2(), // Replace YourNextPage with the actual class for the next page
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
      );
    }

    List<VoidCallback> onTapFunctions = [
      editProfile, // Edit Profile
      helpT,

      () {
        print("Tapped on Share App");
      },

      () {
        print("Tapped on Rate Us");
      },

      () {
        print("Tapped on Send Feedback");
      },

      () {
        print("Tapped on Log Out");
      },

    ];
return SizedBox(
  height: 550,
  width: 400,
  child: ListView.builder(
    itemCount: 6,
    itemBuilder: (_, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Card(
          color: const Color.fromARGB(105, 210, 207, 207),
          semanticContainer: true,
          elevation: 0, // Optionally, you can remove the card elevation
          child: SizedBox( // Wrap ListTile with SizedBox to adjust its height
            height: 67, // Set the height of the card
            child: ListTile(
              title: Text(
                titles[index],
                style: const TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 30,
                  color: Color(0xff5D595B),
                  fontWeight: FontWeight.w400,
                ),
              ),
              leading: Icon(
                icons[index],
                size: 35,
                color: const Color(0xffA26874),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: onTapFunctions[index],
            ),
          ),
        ),
      );
    },
  ),
);


  }
}
