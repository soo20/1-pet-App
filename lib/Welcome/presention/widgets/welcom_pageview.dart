import 'package:flutter/material.dart';
import 'package:petapplication/Welcome/presention/widgets/image_of_yuna_gizmo_wanda_jack.dart';
//import 'package:petapplication/pages/page2/wlelcom2.dart';
//import 'package:petapplication/pages/Defind.dart';
//import 'package:petapplication/pages/defind.dart';
//import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
/*import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/repeatingColorsUse.dart';*/

class WelcomPageView extends StatelessWidget {
  const WelcomPageView({super.key,@required this.pageController, });
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        Yuna(),
        Jack(),
        Gizmo(),
        //TextOverImageItem4(),
        Wanda(),
       // TextOverSVGImage6(),
        
       

        
      ],
    );
  }
}
