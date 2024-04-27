import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:petapplication/pages/define_page/widgets/choose_defintion_type.dart';
import 'package:petapplication/pages/diseases_detection_pages/choose_detection_type.dart';
import 'package:petapplication/pages/homepage/home_page_content.dart';
import 'package:petapplication/pages/my_pets_pages/my_pets.dart';
import 'package:petapplication/pages/setting_bage/setting.dart';
import 'package:petapplication/pages/sign_login_acount/loginbody.dart';
import 'package:petapplication/profile_page/user_profile.dart';

class TheMainHomePage extends StatefulWidget {
  final int receivedIndex;
  const TheMainHomePage({super.key, this.receivedIndex = 0});

  @override

  // intialize the object of HomePageAfterAddingTheReminders to set state for it
  State<TheMainHomePage> createState() => _TheMainHomePage();
}

class _TheMainHomePage extends State<TheMainHomePage> {
  var index = 0;
  final screens = [
    const HomePageAfterAddingPets(),
    const ChooseDetectionType(),
    const MyPetsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: index < 3
            ? Scaffold(
                bottomNavigationBar: CurvedNavigationBar(
                  color: const Color(0xffDCD3D3),
                  backgroundColor: Colors.transparent,

                  onTap: (index) => setState(
                    () => this.index = index,
                  ),
                  // Set no padding on the "add pet" nav bar item to be in a suitable size when tapping on it.
                  iconPadding: index == 3 ? 0 : 12,
                  // to change the icon color when tap on it
                  buttonBackgroundColor: const Color(0xff4A5E7C),
                  // Bottom navigation bar height
                  height: 170.17.h,
                  // Bottom navigation bar items
                  items: [
                    CurvedNavigationBarItem(
                      child: index == 0
                          // to change the color of the icon to white when tapping on this item.
                          ? Image.asset(
                              'assets/icons/home_page_after_adding_reminders_icons/home_icon_on_pressed.png',
                              width: 103.49.w,
                              height: 69.53.h,
                            )
                          : Image.asset(
                              'assets/icons/home_page_after_adding_reminders_icons/home_icon_before_pressed.png',
                              width: 103.49.w,
                              height: 69.53.h,
                            ),
                      label: 'Home',
                      labelStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 42.sp,
                        fontWeight:
                            index == 0 ? FontWeight.w900 : FontWeight.normal,
                        color: const Color(0xff2A606C),
                      ),
                    ),
                    CurvedNavigationBarItem(
                      child: Image.asset(
                        index == 2
                            ? 'assets/icons/home_page_after_adding_reminders_icons/diseases_icon_before_pressed.png'
                            : 'assets/icons/my_pets_page_icons/diseases icon_after_nav.png',
                        width: 103.49.w,
                        height: 69.53.h,
                      ),
                      label: 'Diseases',
                      labelStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 42.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffADBCBF),
                      ),
                    ),
                    CurvedNavigationBarItem(
                      child: Image.asset(
                        index == 2
                            ? 'assets/icons/my_pets_page_icons/my_pets_after_nav.png'
                            : 'assets/icons/home_page_after_adding_reminders_icons/my_pets_before_pressing.png',
                        width: 103.49.w,
                        height: 69.53.h,
                      ),
                      label: 'My pets',
                      labelStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 42.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffADBCBF),
                      ),
                    ),
                    CurvedNavigationBarItem(
                      child: Image.asset(
                        'assets/icons/home_page_after_adding_reminders_icons/add_pet_icon.png',
                        width: 149.53.w,
                        height: 160.28.h,
                      ),
                      label: 'Add pet',
                      labelStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 42.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffADBCBF),
                      ),
                    ),
                  ],
                ),
                // Background color of the body
                backgroundColor: index == 1
                    ? const Color(0xffffffff)
                    : const Color(0xffEFE7E7),
                // App bar at the top of the screen
                appBar: AppBar(
                  // Remove any shadow from the app bar
                  elevation: 0.0,
                  // Set the background color of the app bar
                  backgroundColor: const Color(0xffEFE7E7),
                  // Leading icon/button on the app bar
                  // leading this will put the icon in thr left of app bar as we want to put
                  leading: IconButton(
                    icon: const Icon(Icons.settings, color: Color(0xff4A5E7C)),
                    onPressed: () {},
                    iconSize: 90.sp,
                  ),
                  // Actions on the app bar
                  actions: <Widget>[
                    // Container containing user image and button

                    IconButton(
                        padding: EdgeInsets.only(
                          top: size.width * 0.02,
                        ),
                        onPressed: () {
                          Get.to(
                            const LoginBody(),
                            transition: Transition.zoom,
                          );
                        },
                        icon: Image.asset(
                          'assets/icons/home_page_after_adding_reminders_icons/add_user.png',
                          height: size.height * 0.7947,
                          width: size.width * 0.1,
                        )),
                  ],
                ),
                body: screens[index],
              )
            : const ChooseDefintionType(),
      ),
    );
  }
}
