// ignore_for_file: unused_import

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
//import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';

class Dot extends StatelessWidget {
  // ignore: invalid_required_positional_param
  const Dot( {Key? key, @required this.dotIndex}) : super(key: key);
  final double? dotIndex;

  @override
  Widget build(BuildContext context) {
    // Adjust these values based on your preference
    const dotSize = 12.7;
    const spaceBetweenDots = 3.5;
    const totalDots = 6;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalDots,
        (index) => Container(
          width: dotSize,
          height: dotSize,
          margin: EdgeInsets.only(
              right: index < totalDots - 1 ? spaceBetweenDots : 1),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == dotIndex
                ? const Color(0xff345346)
                : const Color(0xffffffff),
            border: Border.all(
              width: 1.0,
              color: const Color(0xff707070),
            ),
          ),
        ),
      ),
    );
  }
}


        
        
        /*Positioned(
          //left: MediaQuery.of(context).size.width - 29.0,
          right: SizeConfig.defaultSize! * 36,
          top: 774.0,
          bottom: SizeConfig.defaultSize! * 8,
          child: Container(
            width: 13,
            //height: 500,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
        ),
      ],
    );
  }
}*/
