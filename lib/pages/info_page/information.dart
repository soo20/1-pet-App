import 'package:flutter/material.dart';
import 'package:petapplication/pages/info_page/drop_down.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.petType});
  final String petType;
  @override
  State<InfoPage> createState() => _InfoPage();
}

class _InfoPage extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFE7E7),
      body: DropDown(petType: widget.petType),
    );
  }
}
