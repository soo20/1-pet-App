// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:petapplication/pages/info_page/widget_drops.dart'; // Import MyScrollbar if defined elsewhere

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  bool screenDropDown = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEFE7E7),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding:  EdgeInsets.symmetric(
          vertical: size.height * 0.07,
          horizontal: size.width * 0.085,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    ' Type Name:',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 65.sp,
                      color: const Color.fromARGB(182, 74, 94, 124),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  ' Golden Retriever ',
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 75.sp,
                    color: const Color(0xff4A5E7C),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                 SizedBox(height: 55.h),
                const Droper(textContent: 'About',),
                 SizedBox(height: 65.h,),
                const Droper(textContent: 'Health',),
                 SizedBox(height: 65.h,),
                const Droper(textContent: 'Exercise',),
                 SizedBox(height: 65.h,),
                const Droper(textContent: 'Grooming',),
                 SizedBox(height: 65.h,),
                
               
              ],
            ),
          ),
        ),
      ),
    );
  }

}
