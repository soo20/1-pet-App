import 'package:flutter/material.dart';
import 'package:petapplication/pages/info_page/drop_down.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
       
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(255, 212, 211, 205),
         leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color.fromARGB(255, 161, 158, 158),
          ),
          onPressed: () 
          {
            Navigator.of(context).pop();
          },
          iconSize: 30.0,
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