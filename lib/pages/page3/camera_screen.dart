// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:petapplication/pages/detect_page/detect_screen.dart';

class PreviewScreen extends StatefulWidget {
  final String imgPath;
  final void Function(BuildContext) onCapturePressed;

  const PreviewScreen(
      {super.key, required this.imgPath, required this.onCapturePressed});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  late CameraController cameraController;
  String petType = '';
  double maxScore = 0.0;

  Future<void> _getPrediction() async {
    final request = http.MultipartRequest(
      'PUT',
      Uri.parse('http://10.0.2.2:5000/predict3'),
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
          petType = data['prediction'].toString();

          final Map<String, dynamic> predictions = data['predictions'];
          maxScore = 0.0;
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

        if (maxScore < 33) {
          _showLowPredictionAlert(context);
        } else {
          _navigateToDetectScreen(context);
        }
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

  void _showLowPredictionAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xffEFE6E5),
          title: Text(
            'Low Prediction Score',
            style: TextStyle(
              fontFamily: 'Cosffira',
              fontSize: 60.sp,
              color: const Color(0xffA26874),
              fontWeight: FontWeight.w400,
            ),
          ),
          content: Text(
            'The prediction score is lower than expected. Please submit another correct photo or re-take the photo well, '
            'Reasons for this\n'
            '1. You have entered a pet that is not in our database.\n'
            '2. You did not enter an incorrect photo that is not a photo of a pet.',
            style: TextStyle(
              fontFamily: 'Cosffira',
              fontSize: 47.sp,
              color: const Color(0xff354A6B),
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 60.sp,
                  color: const Color(0xffA26874),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _navigateToDetectScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DetectScreen(
        imgPath: widget.imgPath,
        onCapturePressed: widget.onCapturePressed,
        petType: petType,
        prediction: '$maxScore',
      ),
    );
  }

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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.file(
              File(widget.imgPath),
              fit: BoxFit.cover,
            ),
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
                          await _getPrediction();
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
        ],
      ),
    );
  }
}
