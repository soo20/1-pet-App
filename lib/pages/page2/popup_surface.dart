/*import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/page2/popup_surface2.dart';

class PopUpSerfacePage extends StatefulWidget {
  const PopUpSerfacePage({super.key});
  



  @override
  State<PopUpSerfacePage> createState() => _PopUpSerfacePageState();
}

class _PopUpSerfacePageState extends State<PopUpSerfacePage> {
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Column(
         
          mainAxisSize: MainAxisSize.min,

           crossAxisAlignment : CrossAxisAlignment.center ,
          children: [
            
                       const  SizedBox(
                          height: 15,
                        )
        ,          
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 1.5,
                    horizontal: SizeConfig.defaultSize! * 7),

               child:  const CustomGeneralButtom2(
                          height: 42,
                          text: 'Continue With Google',
                          textColor: kMainColorPage,
                          icon: FontAwesomeIcons.google,
                          iconcolor: Color.fromARGB(255, 248, 54, 90),
                          boxColor: kMainColor,
                          borderColor: kMainColor,
                          width: null,
                        )
                     
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 0.001,
                    horizontal: SizeConfig.defaultSize! * 7),
                   
                child:const  CustomGeneralButtom2(
                          height: 42,
                          text: 'Continue With Email',
                     
                          textColor: kMainColorPage,
                          icon: FontAwesomeIcons.envelope,
                          iconcolor: kMainColorPage,
                          boxColor: const Color.fromARGB(255, 248, 54, 90),
                          borderColor: const Color.fromARGB(255, 248, 54, 90),
                          width: null,
                        )
                     
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 1.4,
                    horizontal: SizeConfig.defaultSize! * 7),
                child:CustomGeneralButtom2(
                          height: 42,
                          text: 'Continue With Facebook',
                          icon: FontAwesomeIcons.facebook,
                          iconcolor: kMainColorPage,
                          textColor: kMainColorPage,
                          boxColor: kMainColorSplash,
                          borderColor: kMainColorPage,
                          width: SizeConfig.screenWidth,
                        )
                      
              ),
            ),
              const  SizedBox(
                height: 40,
               )       // Add more widgets as needed for the sign-up form
                      ],
                    );
  }
}*/