// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

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

class _EnsureTakingImageState extends State<EnsureTakingImage>
    with SingleTickerProviderStateMixin {
  late CameraController cameraController;
  String detectionResult = "";
  bool isLoading = true;
  double maxScore = 0.0;

  // Simulate model processing
  Future<void> processImage() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(
        const Duration(seconds: 6)); // Adjust the seconds as needed
    if (widget.detectionType) {
      // Call the skin prediction method
      await _getPredictionSkin();
    } else {
      // Call the boob prediction method
      await _getPredictionBoob();
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _getPredictionSkin() async {
    final request = http.MultipartRequest(
      'PUT',
      Uri.parse('http://10.0.2.2:5000/predict'),
    );
    request.files
        .add(await http.MultipartFile.fromPath('file', widget.imgPath));
    print('Sending request to server...');

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print('Response received: $responseBody');
        final Map<String, dynamic> data = json.decode(responseBody);
        setState(() {
          detectionResult = data['prediction'].toString();

          final Map<String, dynamic> predictions = data['predictions'];
          maxScore = 0.0; // Reset maxScore
          var maxClass = '';
          predictions.forEach((key, value) {
            final score = double.parse(value.replaceAll('%', ''));
            if (score > maxScore) {
              maxScore = score;
              maxClass = key;
            }
          });
          print('Biggest Prediction Score: $maxScore for $maxClass');
        });
      } else {
        print('Failed to load prediction: ${response.statusCode}');
        print('Response body: $responseBody');
        throw Exception('Failed to load prediction: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to load prediction');
    }
  }

  Future<void> _getPredictionBoob() async {
    final request = http.MultipartRequest(
      'PUT',
      Uri.parse('http://10.0.2.2:5000/predict2'),
    );
    request.files
        .add(await http.MultipartFile.fromPath('file', widget.imgPath));
    print('Sending request to server...');

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print('Response received: $responseBody');
        final Map<String, dynamic> data = json.decode(responseBody);
        setState(() {
          detectionResult = data['prediction'].toString();

          final Map<String, dynamic> predictions = data['predictions'];
          maxScore = 0.0; // Reset maxScore
          var maxClass = '';
          predictions.forEach((key, value) {
            final score = double.parse(value.replaceAll('%', ''));
            if (score > maxScore) {
              maxScore = score;
              maxClass = key;
            }
          });
          print('Biggest Prediction Score: $maxScore for $maxClass');
        });
      } else {
        print('Failed to load prediction: ${response.statusCode}');
        print('Response body: $responseBody');
        throw Exception('Failed to load prediction: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to load prediction');
    }
  }

  @override
  void initState() {
    super.initState();

    processImage();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
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
      body: isLoading
          ? Center(
              child: Image.network(
                  'https://i.giphy.com/dCMV8kWz1efSMvSSvM.webp',
                  width: 250,
                  height: height))
          : Container(
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
                            onPressed: () async {
                              await processImage();
                              Get.to(
                                DetectionResulrPage(
                                    detectionType: widget.detectionType,
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
