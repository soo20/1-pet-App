// ignore_for_file: file_names

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:petapplication/Welcome/presention/widgets/Component1311.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
//import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

class Deefine extends StatelessWidget {
  const Deefine({
    Key? key,
  }) : super(key: key);

  // rest of the code...

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kMainColorPage,
      child: Stack(children: [
        Positioned(
          top: 177,
          right: -35,
          bottom: 130,
          width: 320,
          child: Padding(
            padding:
                const EdgeInsets.all(51.0), // Add padding of 8.0 to all sides
            child: Image.asset(
              'assets/image/Group786.png',

              fit: BoxFit.fill, // Adjust the fit as needed
            ),
          ),
        ),
        const Positioned(child: Component1313()),
        Positioned(
            height: 50,
            right: 50,
            left: SizeConfig.defaultSize! * 22,
            bottom: SizeConfig.defaultSize! * 6,
            child: const CustomGeneralButtom(
              text: 'ADD MANUALLY ',
              textColor: Color(0xFFE3B1A8),
              boxColor: kMainColor, height: 60,
            ),),
        Positioned(
            height: 50,
            left: 50,
            right: SizeConfig.defaultSize! * 22,
            bottom: SizeConfig.defaultSize! * 6,
            child: const CustomGeneralButtom(

              text: 'DEFINE WITH JACK',
              textColor: kMainColor,
              boxColor: Color(0xFFE3B1A8), height: 60,
            )),
      ]),
    );
  }
}
//