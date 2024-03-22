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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 211, 205),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 36,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    ' Type Name:',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 55.sp,
                      color: const Color(0xff2A606C),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  ' Golden Retriever ',
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 60.sp,
                    color: const Color(0xffDC3356),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                const Droper(textContent: 'About',),
                SizedBox(height: 100.h,),
                const Droper(textContent: 'Health',),
                 SizedBox(height: 100.h,),
                const Droper(textContent: 'Exercise',),
                 SizedBox(height: 100.h,),
                const Droper(textContent: 'Grooming',),
                
               
              ],
            ),
          ),
        ),
      ),
    );
  }

}
