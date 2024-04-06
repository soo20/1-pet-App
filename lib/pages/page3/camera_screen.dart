
// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'dart:io';


import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:petapplication/pages/detect_page/detect_screen.dart';


class PreviewScreen extends StatefulWidget{
  final String imgPath;
    final void Function(BuildContext) onCapturePressed; 

  const PreviewScreen({super.key, required this.imgPath, required this.onCapturePressed});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();

}
class _PreviewScreenState extends State<PreviewScreen>{
  
   late CameraController cameraController;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
       
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
         leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff9F9A95),
          ),
          onPressed: () 
          {
            Navigator.of(context).pop();
          },
          iconSize: 39.0,
          padding: const EdgeInsets.only(
              left: 6.0
              ), 
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(

        children: [
         
          Positioned.fill(
          
            child: Image.file(File(widget.imgPath),fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              
              width: double.infinity,
              height: 400.h,
              color: Colors.transparent,
              child: Center(
                child: Row(
                 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: IconButton(
                                              
                        color: Colors.blue,
                          onPressed: () 
                          {
                              Navigator.of(context).pop();
                          },
                           icon: SvgPicture.asset('assets/icons/rephoto.svg'
                        ,width: 200.w,
                        height: 200.h,
                        ),
                           ),
                      ),
                      SizedBox(width: 200.w,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                      
                      color: Colors.blue,
                          onPressed: ()
                          {
                          /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetectScreen(
                                imgPath: widget
                                    .imgPath, // Pass the image path to DetectScreen
                                onCapturePressed: widget
                                    .onCapturePressed, // Pass the function to DetectScreen
                              ),
                            ),
                          ); */
                            
                            showDialog(
                              context: context,
                              builder: (context) =>   DetectScreen(
                                imgPath: widget
                                    .imgPath, 
                                onCapturePressed: widget
                                    .onCapturePressed, 
                              ),);
                          },
                          icon: SvgPicture.asset('assets/icons/right.svg'
                        ,width: 200.w,
                        height: 200.h,
                        ),
                           ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  
}