import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/info_page/information.dart';
import 'package:petapplication/pages/pet_setting_pages/add_pet.dart';

class DetectScreen extends StatefulWidget {
  final String imgPath; // Image path from PreviewScreen
  final void Function(BuildContext) onCapturePressed;
  const DetectScreen({
    super.key,
    required this.imgPath,
    required this.onCapturePressed,
    required this.petType,
    this.prediction,
    this.petIsDogOrCat,
  });
  final String petType;
  final String? petIsDogOrCat;
  final String? prediction;
  @override
  State<DetectScreen> createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  late CameraController cameraController;
  bool isLoading = true;
  bool isImageLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.prediction != null &&
          double.tryParse(widget.prediction!)! < 33) {
        _showLowPredictionAlert(context);
      }
    });
  }

  Future<void> _loadImage() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Simulate network image load
      await Future.delayed(const Duration(seconds: 4));
      setState(() {
        isImageLoaded = true;
      });
    } catch (e) {
      // Handle any errors during image load
      print('Failed to load image: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showLowPredictionAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xffEFE6E5),
          title: const Text('Low Prediction Score'),
          content: const Text(
              'The prediction score is less than 33%. Please re-take the photo for a better prediction.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: isLoading
          ? Center(
              child: Image.network(
                  'https://i.giphy.com/dCMV8kWz1efSMvSSvM.webp',
                  width: 250,
                  height: height))
          : isImageLoaded
              ? Align(
                  child: Container(
                      height: size.height,
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/image/detectScreen.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.16,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: size.height * 0.240,
                                width: size.width * 0.540,
                                decoration: BoxDecoration(
                                    // color: const Color(0xffEEEFEF), // Box color
                                    borderRadius: BorderRadius.circular(60.r),
                                    border: Border.all(
                                        color: const Color(0xff707070),
                                        width: 0.4)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60.r),
                                  child: Image.file(
                                    File(widget.imgPath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                // we put the text string.
                                'Your Pet Type is',
                                //to style your text:
                                style: TextStyle(
                                  fontFamily: 'Cosffira',
                                  //to make adaptive font size we call 'sp' function.
                                  fontSize: 45.sp,
                                  color: const Color(0xff4A5E7C),
                                  //to make your font normal "regular" or bold.
                                  fontWeight: FontWeight.normal,
                                ),
                                /*The content of the text was large, 
                  so it was moved to the front when displaying,
                  and to make it in the center, I put this argument*/
                              ),
                              Text(
                                // we put the text string.
                                '${widget.prediction ?? 'No Prediction'}%',
                                //to style your text:
                                style: TextStyle(
                                  fontFamily: 'Cosffira',
                                  //to make adaptive font size we call 'sp' function.
                                  fontSize: 60.sp,
                                  color: const Color(0xffA26874),
                                  //to make your font normal "regular" or bold.
                                  fontWeight: FontWeight.bold,
                                ),
                                /*The content of the text was large, 
                  so it was moved to the front when displaying,
                  and to make it in the center, I put this argument*/
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                // we put the text string.
                                widget.petType,
                                //to style your text:
                                style: TextStyle(
                                  fontFamily: 'Cosffira',
                                  //to make adaptive font size we call 'sp' function.
                                  fontSize: 45.sp,
                                  color: const Color(0xff080808),
                                  //to make your font normal "regular" or bold.
                                  fontWeight: FontWeight.bold,
                                ),

                                textAlign: TextAlign.center,

                                softWrap: false,
                              ),
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 0),
                                  child: CustomGeneralButtom(
                                    height: 155.h,
                                    fontWeight: FontWeight.bold,
                                    text: 'Know more about this type',
                                    textColor: const Color(0xffFFFFFF),
                                    onTap: () {
                                      Get.to(
                                        () => InfoPage(
                                          petType: widget.petType,
                                          petIsDogOrCat: widget.petIsDogOrCat,
                                        ), // Replace YourNextPage with the actual class for the next page
                                        transition: Transition.rightToLeft,
                                        duration:
                                            const Duration(milliseconds: 300),
                                      );
                                    },
                                    boxColor: const Color(0xff4A5E7C),
                                    borderColor: const Color(0xff4A5E7C),
                                    width: 700.w,
                                    customFontSize: 40.sp,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  child: CustomGeneralButtom(
                                    fontWeight: FontWeight.bold,
                                    height: 155.h,
                                    text: 'Add to your pets',
                                    onTap: () {
                                      Get.to(
                                        () => AddPets(
                                          petType: widget.petType,
                                        ), // Replace YourNextPage with the actual class for the next page
                                        transition: Transition.rightToLeft,
                                        duration:
                                            const Duration(milliseconds: 300),
                                      );
                                    },
                                    customFontSize: 44.sp,
                                    textColor: const Color(0xffFFFFFF),
                                    boxColor: const Color(0xffA26874),
                                    borderColor: const Color(0xffA26874),
                                    width: 700.w,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9, horizontal: 0),
                                  child: CustomGeneralButtom(
                                    fontWeight: FontWeight.bold,
                                    height: 155.h,
                                    text: 'Rephoto',
                                    customFontSize: 45.sp,
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    textColor: const Color(0xffE3B1A8),
                                    boxColor: const Color(0xffFFFFFF),
                                    borderColor: const Color(0xffFFFFFF),
                                    width: 700.w,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                )
              : Center(
                  child: Text(
                    'Failed to load image',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
    );
  }
}
