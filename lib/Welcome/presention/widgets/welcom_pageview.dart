import 'package:flutter/material.dart';
import 'package:petapplication/Welcome/presention/widgets/image_of_yuna_gizmo_wanda_jack.dart';
//import 'package:petapplication/pages/page2/wlelcom2.dart';
//import 'package:petapplication/pages/Defind.dart';
//import 'package:petapplication/pages/defind.dart';
//import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
/*import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/repeatingColorsUse.dart';*/

<<<<<<< HEAD:lib/Welcome/presention/widgets/custom_welcompage.dart
class CustomWelcomPage extends StatelessWidget {
  const CustomWelcomPage({
    super.key,
    @required this.pageController,
  });
  //in this variable we put the argument value when calling widget
=======
class WelcomPageView extends StatelessWidget {
  const WelcomPageView({super.key,@required this.pageController, });
>>>>>>> fe82d195133b33866963e9e2e5649c56e6bdc314:lib/Welcome/presention/widgets/welcom_pageview.dart
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
<<<<<<< HEAD:lib/Welcome/presention/widgets/custom_welcompage.dart
        TextOverImageItem1(
            //image2: 'assets/icons/k1.svg',
            ),
        TextOverImageItem2(),
        TextOverImageItem3(),
        TextOverImageItem4(),
        TextOverSVGImage5(),
        TextOverSVGImage6(),
=======
        Yuna(),
        Jack(),
        Gizmo(),
        //TextOverImageItem4(),
        Wanda(),
       // TextOverSVGImage6(),
        
       

        
>>>>>>> fe82d195133b33866963e9e2e5649c56e6bdc314:lib/Welcome/presention/widgets/welcom_pageview.dart
      ],
    );
  }
}
