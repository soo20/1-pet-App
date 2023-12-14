import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/core/utils/widgets/space.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = SizeConfig.screenWidth! / SizeConfig.screenHeight!;
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Column(
        
        children: [
          
          const VerticalSpace(8.5),
           Text(
            'Yuna\n',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 50,
              color: const Color(0xff0b2f37),
              fontWeight: FontWeight.w600,
              height:SizeConfig.defaultSize! * 0.03,
            ),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 30,
            width: SizeConfig.defaultSize! * 30,
            child: Image.asset('assets/image/Group841.png'),
          ),
         /* Container(
            width: 260,
            height: 44,
            margin: EdgeInsets.only(
              bottom: SizeConfig.defaultSize! * 0,
              top: SizeConfig.defaultSize! * 2.2,
              left: SizeConfig.defaultSize! * 2,
              right: SizeConfig.defaultSize! * 2,
            ),
            child: const CustomGeneralButtom(
              text: 'Login with Gmail',
              textColor: kMainColorPage,
              boxColor: kMainColor, borderColor: kMainColor,
            ),
          ),
          Container(
            width: 260,
            height: 42,
            margin: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize!*1),
            child: const CustomGeneralButtom(
              text: 'LOGIN With Facebook',
              textColor: kMainColorPage,
              boxColor: kMainColorSplash, borderColor: kMainColorPage,
            ),
          ),
          Container(
            width: 260,
            height: 42,
            margin: EdgeInsets.only(
              bottom: SizeConfig.defaultSize! * 2,
            ),
            child: const CustomGeneralButtom(
              text: 'LOGIN With Email',
              textColor: kMainColorPage,
              boxColor: Color.fromARGB(255, 248, 54, 90), borderColor: Color.fromARGB(255, 248, 54, 90),
            ),
          ),*/

          Flexible(
            flex: 2,
            child: Padding
            
            (padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize!*1.5,horizontal:SizeConfig.defaultSize!*8 ),
            child:  const CustomGeneralButtom2(
              text: 'LOGIN WITH GMAIL',
              textColor: kMainColorPage,
               icon: FontAwesomeIcons.google,
               iconcolor: Color.fromARGB(255, 248, 54, 90),
              boxColor: kMainColor, borderColor: kMainColor,
            ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding
            (padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize!*0.001 ,horizontal:SizeConfig.defaultSize!*8 ),
            child:  const CustomGeneralButtom2(
               text: 'LOGIN WITH FACEBOOK',
               icon: FontAwesomeIcons.facebook,
               iconcolor:kMainColorPage,
              textColor: kMainColorPage,
              boxColor: kMainColorSplash, borderColor: kMainColorPage,
            ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding
            (padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize!*1.4,horizontal:SizeConfig.defaultSize!*8 ),
            child:  const CustomGeneralButtom2(
              text: 'LOGIN WITH EMAIL',
              textColor: kMainColorPage,
             icon: FontAwesomeIcons.envelope,
             iconcolor: kMainColorPage,
              boxColor: Color.fromARGB(255, 248, 54, 90), borderColor: Color.fromARGB(255, 248, 54, 90),
            ),
            ),
          ),
           RichText(
            text: const TextSpan(
              text:  'Don\'t.have an account? ' ,
              style: TextStyle(
              fontFamily: 'Poppins',
                 fontSize: 14,
              color: Color(0xff090f0f),
              fontWeight: FontWeight.w400,
              ),
              children:  <TextSpan>[
                TextSpan( 
                 text : 'Sign Up',
                  style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14.4,
              color:  Color(0xff090f0f),
              fontWeight: FontWeight.w900,
            ),
           
                )
              ],
              
          ),
           textAlign: TextAlign.center,
          ),
          // Add the rest of your widgets here, for example, text fields, buttons, etc.
        ],
        
      ),
    );
  }
}
