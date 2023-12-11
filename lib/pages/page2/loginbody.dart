

import 'package:flutter/material.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/space.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const VerticalSpace(6),
        SizedBox(
          height: SizeConfig.defaultSize! * 17,
          child: Image.asset('assets/image/Group841.png'),
        ),
       const  Text(
          'yun\n',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 35,
            color:  Color(0xff0b2f37),
            fontWeight: FontWeight.w600,
            height: 0.7,
          ),
          
        )
      ],
    );
  }
}
