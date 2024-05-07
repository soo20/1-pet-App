// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:petapplication/pages/info_page/widget_drops.dart'; // Import MyScrollbar if defined elsewhere

class DropDown extends StatefulWidget {
  final String petType;
  const DropDown({super.key, required this.petType});

  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<DropDown> {
  bool screenDropDown = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: size.height * 0.3,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/image/pet_inf_type_image/GoldenFromScrapping.jpeg",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.085,
            ),
            child: Column(
              children: [
                Text(
                  widget.petType,
                  style: TextStyle(
                    height: size.height * 0.003,
                    fontFamily: 'Cosffira',
                    fontSize: 75.sp,
                    color: const Color(0xff4A5E7C),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 55.h),
                const Droper(textContent: 'About'),
                SizedBox(height: 65.h),
                const Droper(textContent: 'Health'),
                SizedBox(height: 65.h),
                const Droper(textContent: 'Exercise'),
                SizedBox(height: 65.h),
                const Droper(textContent: 'Grooming'),
                SizedBox(height: 65.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
