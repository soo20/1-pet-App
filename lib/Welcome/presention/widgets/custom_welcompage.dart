import 'package:flutter/material.dart';
import 'package:petapplication/Welcome/presention/widgets/welcomet_image_text.dart';
//import 'package:petapplication/pages/page2/wlelcom2.dart';
//import 'package:petapplication/pages/Defind.dart';
//import 'package:petapplication/pages/defind.dart';
//import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
/*import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/repeatingColorsUse.dart';*/

class CustomWelcomPage extends StatelessWidget {
  const CustomWelcomPage({super.key,@required this.pageController, });
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        TextOverImageItem1(
         
          //image2: 'assets/icons/k1.svg',
        ),
        TextOverImageItem2(),
        TextOverImageItem3(),
        TextOverImageItem4(),
        TextOverSVGImage5(),
        TextOverSVGImage6(),
        
       

        
      ],
    );
  }
}
