// ignore_for_file: unused_import

import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';

//ده فايل هستخدمه كتير علشان هحط فيه كل البوتمز الي هستخدمها

import 'package:petapplication/core/utils/size_config.dart';

//ده يستخدم اكتر حاجه
class CustomGeneralButtom extends StatelessWidget {
  final Color boxColor;
  final Color textColor;
  
  
  const CustomGeneralButtom({
    Key? key,
    this.text,
    this.svgPath,
    this.onTap,
    this.buttonTextResolver,
    required this.boxColor,
    required this.textColor, 
  }) : super(key: key);
  final String? text;
  final String? svgPath;

  final String Function(int)? buttonTextResolver;
  // void function
  final VoidCallback? onTap;
  // Path to your SVG asset or SVG string

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        // خليته ياخد العرض بتاع الاسكرين علشان اغير في الحجم براحتي
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: boxColor,

          borderRadius: BorderRadius.circular(35),
           
        ),
        //The Row widget contains an Expanded widget that wraps your existing
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // Align content to the end (far right)
          children: [
          
            Expanded(
              // Adjust the right padding as needed
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    child: Text(
                      text ??
                          'Default Text', // Provide a default value if text is null
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomGeneralButtom2 extends StatelessWidget {
  final Color boxColor;
  final Color textColor;
  final IconData? icon;
  final Color? iconcolor ;
  final Color borderColor;
  const CustomGeneralButtom2({
    Key? key,
    this.text,
    this.svgPath,
    this.onTap,
    this.buttonTextResolver,
    required this.boxColor,
    required this.textColor, this.icon,
    required this.borderColor, this.iconcolor,
  }) : super(key: key);
  final String? text;
  final String? svgPath;

  final String Function(int)? buttonTextResolver;
  // void function
  final VoidCallback? onTap;
  // Path to your SVG asset or SVG string

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        // خليته ياخد العرض بتاع الاسكرين علشان اغير في الحجم براحتي
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: boxColor,

          borderRadius: BorderRadius.circular(35),
           border: Border.all(color:borderColor ),
        ),
        //The Row widget contains an Expanded widget that wraps your existing
        child: Row(
          
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,// Align content to the end (far right)
          children: [
           // Alignment(x, y)
            
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 11.1),
                child: Icon(
                  icon,
                  color: iconcolor,
                 
                ),
              ),
            Expanded(
              // Adjust the right padding as needed
              child: Stack(
               // alignment: Alignment.centerLeft,
                children: <Widget>[
                  Positioned(
                    child:Align(
                      alignment:const Alignment(-0.531, 0.133),
                    child : Text(
                      text ??
                          'Default Text', // Provide a default value if text is null
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                      softWrap: false,
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

