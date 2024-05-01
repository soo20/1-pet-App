// ignore_for_file: avoid_print



import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:petapplication/pages/setting_bage/alart_page.dart';

import 'package:petapplication/pages/setting_bage/help_tips.dart';
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
                left: size.width *0.08, 
                top: size.height *0.01),
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
               left: size.width *0.035,
               right: size.width *0.035, 
                top: size.height *0.01),
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
    builder: (context) => 
    Alart1(
      title: 'https://translate.google.com', 
      confirmButtonText: 'Copy Link', 
      confirmButtonText2: 'Decline',
      customFontSize: 50.sp, 
      padding: EdgeInsets.only(top: size.height *0.05), 
      padding2:EdgeInsets.only(top: size.height *0.02)
      ),
  );
}



    void logOut() {
     showDialog(
    context: ccontext,
    builder: (context) => 
    Alart1(
      title: 'Are You Sure You Want To Log Out', 
      confirmButtonText: 'Yes', 
      confirmButtonText2: 'Cancle',
      
      customFontSize: 50.sp, 
      padding: EdgeInsets.only(top: size.height *0.05), 
      padding2:EdgeInsets.only(top: size.height *0.02)
      ),
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

      logOut,

    ];
return SizedBox(
  height: size.height,
  width: size.width,
  child: ListView.builder(
    itemCount: 6,
    itemBuilder: (_, index) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height *0.006),
        child: Card(
          color: const Color.fromARGB(105, 210, 207, 207),
          semanticContainer: true,
          elevation: 0, 
          child: SizedBox( 
            height: 67, 
            child: ListTile(
              title: Text(
                titles[index],
                style:  TextStyle(
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
