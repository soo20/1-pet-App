import 'package:cloud_firestore/cloud_firestore.dart';
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
  final int? index1; // Define index here
  const TheMainHomePage({
    super.key,
    this.index1,
  });

  @override

  // intialize the object of HomePageAfterAddingTheReminders to set state for it
  State<TheMainHomePage> createState() => _TheMainHomePage();
}

//var to check if the user is login in or not!!
bool isLogin = false;

class _TheMainHomePage extends State<TheMainHomePage> {
  late int index;
  final screens = [
    const HomePageAfterAddingPets(),
    const ChooseDetectionType(),
    const MyPetsPage(),
  ];
  @override
  void initState() {
    super.initState();
    index = widget.index1 ??
        0; // Set _currentIndex to the value of index passed from constructor
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? userInfo = FirebaseAuth.instance.currentUser;
    final double height = size.height;
    // final double width = size.width;
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: index < 3
            ? Scaffold(
                bottomNavigationBar: CurvedNavigationBar(
                  color: const Color.fromARGB(255, 200, 185, 185),
                  backgroundColor: Colors.transparent,
                  index: index,
                  onTap: (index) => setState(
                    () => this.index = index,
                  ),
                  // Set no padding on the "add pet" nav bar item to be in a suitable size when tapping on it.
                  iconPadding: index == 3 ? 0 : 12,
                  // to change the icon color when tap on it
                  buttonBackgroundColor: const Color(0xff4A5E7C),
                  // Bottom navigation bar height
                  height: size.height * 0.1,
                  // Bottom navigation bar items
                  items: [
                    CurvedNavigationBarItem(
                      child:
                          // to change the color of the icon to white when tapping on this item.
                          Image.asset(
                        index == 0
                            ? 'assets/icons/home_page_after_adding_reminders_icons/home_icon_on_pressed.png'
                            : 'assets/icons/home_page_after_adding_reminders_icons/home_icon_before_pressed.png',
                        width: 103.49.w,
                        height: 69.53.h,
                      ),
                      label: 'Home',
                      labelStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 42.sp,
                        fontWeight:
                            index == 0 ? FontWeight.w900 : FontWeight.normal,
                        color: index == 0
                            ? const Color(0xff4A5E7C)
                            : const Color(0xff9A9EAC),
                      ),
                    ),
                    CurvedNavigationBarItem(
                      child: Image.asset(
                        index == 1
                            ? 'assets/icons/home_page_after_adding_reminders_icons/diseases_icon_before_pressed.png'
                            : 'assets/icons/home_page_after_adding_reminders_icons/diseases_icon.png',
                        width: 103.49.w,
                        height: 69.53.h,
                      ),
                      label: 'Diseases',
                      labelStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 42.sp,
                        fontWeight: FontWeight.normal,
                        color: index == 1
                            ? const Color(0xff4A5E7C)
                            : const Color(0xff9A9EAC),
                      ),
                    ),
                    CurvedNavigationBarItem(
                      child: Image.asset(
                        index == 2
                            ? 'assets/icons/home_page_after_adding_reminders_icons/my_pets_on_pressed.png'
                            : 'assets/icons/home_page_after_adding_reminders_icons/my_pets_before_pressing.png',
                        width: 103.49.w,
                        height: 69.53.h,
                      ),
                      label: 'My pets',
                      labelStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 42.sp,
                        fontWeight: FontWeight.normal,
                        color: index == 2
                            ? const Color(0xff4A5E7C)
                            : const Color(0xff9A9EAC),
                      ),
                    ),
                    CurvedNavigationBarItem(
                      child: Image.asset(
                        'assets/icons/home_page_after_adding_reminders_icons/add_pet_icon.png',
                        width: size.width * 0.06,
                        height: size.height * 0.06,
                      ),
                      label: 'Add pet',
                      labelStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 42.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff9A9EAC),
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
                  surfaceTintColor: Colors.transparent,
                  // Remove any shadow from the app bar
                  elevation: 0.0,
                  // Set the background color of the app bar
                  backgroundColor: const Color(0xffEFE7E7),
                  // Leading icon/button on the app bar
                  // leading this will put the icon in thr left of app bar as we want to put
                  leading: IconButton(
                    icon: const Icon(Icons.settings, color: Color(0xff4A5E7C)),
                    onPressed: () {
                      Get.to(
                        () => Setting(
                          ccontext: context,
                        ),
                        transition: Transition.zoom,
                      );
                    },
                    iconSize: 90.sp,
                  ),
                  // Actions on the app bar
                  actions: <Widget>[
                    // Container containing user image and button
                    userInfo?.email != null
                        ? IconButton(
                            padding: EdgeInsets.only(
                              top: size.width * 0.02,
                            ),
                            onPressed: () {
                              Get.to(
                                () => const UserAcount(),
                                transition: Transition.zoom,
                              );
                            },
                            icon: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(userInfo!.uid)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return CircleAvatar(
                                    radius: height * 0.023,
                                    backgroundImage: const AssetImage(
                                        'assets/image/Group 998.png'),
                                  );
                                } else {
                                  return CircleAvatar(
                                    radius: height * 0.023,
                                    foregroundImage:
                                        snapshot.data?['profile_image'] != null
                                            ? NetworkImage(
                                                snapshot.data!['profile_image'])
                                            : null,
                                    backgroundImage: const AssetImage(
                                        'assets/image/Group 998.png'),
                                  );
                                }
                              },
                            ))
                        : IconButton(
                            padding: EdgeInsets.only(
                              top: size.width * 0.02,
                            ),
                            onPressed: () {
                              Get.to(
                                () => const LoginBody(),
                                transition: Transition.zoom,
                              );
                            },
                            icon: Image.asset(
                              'assets/icons/home_page_after_adding_reminders_icons/add_user.png',
                              height: size.height * 0.7947,
                              width: size.width * 0.1,
                            ),
                          ),
                  ],
                ),
                body: screens[index],
              )
            : const ChooseDefintionType(),
      ),
    );
  }
}
