import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DetectionResulrPage extends StatefulWidget {
  const DetectionResulrPage(
      {super.key, required this.detectionType, required this.detectionResult});
  final bool detectionType;
  final String detectionResult;
  @override
  State<DetectionResulrPage> createState() => _DetectionResulrPageState();
}

class _DetectionResulrPageState extends State<DetectionResulrPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(),
    );
  }
}
