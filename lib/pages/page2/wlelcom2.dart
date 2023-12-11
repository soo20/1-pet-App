// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/space.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(4),
        SizedBox(
          
          height: SizeConfig.defaultSize * 17,
          child: Image.asset('assets/image/Group841.png'),
        ),
       Text(
    'yuna\n',
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 121,
      color: const Color(0xff0b2f37),
      fontWeight: FontWeight.w700,
      height: 0.6611570247933884,
    ),
    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
    textAlign: TextAlign.center,
    softWrap: false,
  )
      ],
    );
  }
}