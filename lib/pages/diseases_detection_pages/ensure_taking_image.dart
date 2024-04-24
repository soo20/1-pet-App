// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:petapplication/pages/diseases_detection_pages/detection_result_page.dart';

class EnsureTakingImage extends StatefulWidget {
  final String imgPath;
  final void Function(BuildContext) onCapturePressed;
  final bool detectionType;

  const EnsureTakingImage(
      {super.key,
      required this.imgPath,
      required this.onCapturePressed,
      required this.detectionType});

  @override
  _EnsureTakingImageState createState() => _EnsureTakingImageState();
}

class _EnsureTakingImageState extends State<EnsureTakingImage> {
  late CameraController cameraController;
  final String detectionResult = "healthy";
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
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 39.0,
          padding: const EdgeInsets.only(left: 6.0),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(
            File(widget.imgPath),
          ),
        )),
        child: Align(
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/rephoto.svg',
                        width: 200.w,
                        height: 200.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      color: Colors.blue,
                      onPressed: () {
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

                        Get.to(
                          DetectionResulrPage(
                              detectionType: true,
                              detectionResult: detectionResult),
                          transition: Transition.zoom,
                        );
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/right.svg',
                        width: 200.w,
                        height: 200.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
