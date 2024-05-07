import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petapplication/pages/info_page/drop_down.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFE7E7),
       
      appBar: AppBar(
        toolbarHeight: 72.h,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xffEFE7E7),
         leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff4A5E7C),
          ),
          onPressed: () 
          {
            Navigator.of(context).pop();
          },
          iconSize: 32.0,
          padding: const EdgeInsets.only(
              left: 6.0
              ), 
        ),
      ),
      extendBodyBehindAppBar: true,
      body:const  DropDown(),
    );
  }
}