
import 'package:flutter/material.dart';


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
