import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petapplication/pages/homepage/scrolled_events.dart';

/*we will create this page with statefull widget because the content of widgets 
in this page have a dynamic variables.*/
class HomePageAfterAddingPets extends StatefulWidget {
  const HomePageAfterAddingPets({super.key});
  @override
  //intialize the object of HomePageAfterAddingTheReminders to set state for it
  State<HomePageAfterAddingPets> createState() => _HomePageAfterAddingPets();
}

class _HomePageAfterAddingPets extends State<HomePageAfterAddingPets> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffEEEFEF),
      appBar: AppBar(
        //to remove any shadow
        elevation: 0.0,
        //to make the same color to the entire home screen
        backgroundColor: const Color(0xffEEEFEF),
        //leading this will put the icon in thr left of app bar as we want to put
        leading: IconButton(
          icon: const Icon(Icons.settings, color: Color(0xff2A606C)),
          onPressed: () {},
          iconSize: 90.sp,
        ),
        actions: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: (15.0), top: 4.0),
                child: Image.asset(
                  'assets/image/home_page_afterAdding_pets_assets/person_image_in_app_bar.png', // Replace with your image path
                  width: 90.w,
                  height: 90.h,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 5,
                left: 0.5,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/home_page_after_adding_reminders_icons/Round Btn Default Dark.png', // Replace with your image path
                    width: 65.w,
                    height: 65.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Future Events',
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 89.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xff2A606C),
                  shadows: [
                    Shadow(
                      color: const Color(0xff000000),
                      offset: const Offset(1.0, 1.0),
                      blurRadius: 10.0.r,
                    ),
                  ],
                ),
              ),
            ),
            const ScrolledEvents(),
          ],
        ),
      ),
    ));
  }
}
