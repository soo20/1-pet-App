import 'package:flutter/material.dart';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';



import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';


class PageViewLogin extends StatelessWidget {
  const PageViewLogin({super.key,@required this.pageController, });
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(19),
      borderSide: const BorderSide(width: 1.0, color:  Color.fromARGB(70, 112, 112, 112)));
    double aspectRatio = screenHeight/screenWidth;
    return PageView(
      controller: pageController,
      children:  [
        Column(
         
          mainAxisSize: MainAxisSize.min,

           crossAxisAlignment : CrossAxisAlignment.center ,
          children: [
            
                        const SizedBox(
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
                   
                child: CustomGeneralButtom2(
                          height: 42,
                          text: 'Continue with Email',
                      onTap: () {
                      if (pageController!.page! < 1) {
                        pageController?.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn);
                      } 
                    },
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
                    ),
       AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        padding: EdgeInsets.only(
                      bottom: screenHeight*0 ,
                      right: screenWidth *0.065,
                      left:screenWidth*0.065,
                      //top: screenWidth *0.08
                    ),
        child: Column(
             
              mainAxisSize: MainAxisSize.min,
        
               crossAxisAlignment : CrossAxisAlignment.center ,
              children: [
                
                           const  SizedBox(
                              height: 15,
                            )
            ,   
                   
               Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 0.0,
                    horizontal: SizeConfig.defaultSize! * 0),
                 child: TextFormField(
                   expands: false,
                          obscureText:true ,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (newValue) => 2,
                          style:const TextStyle(color: Color(0xff090F0F)),
                          keyboardAppearance: Brightness.light,
                              decoration: InputDecoration(
                                
                                fillColor:const Color(0xFFFFFFFF),
                                filled: true,
                                hintText: 'Email',
                               hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                   fontSize: 14,
                                 color: Color.fromARGB(116, 19, 79, 92),
                                  fontWeight: FontWeight.w600,
                                     ),
                                enabledBorder: border,
                                focusedBorder: border,
                                prefixIcon: const Icon(
                                  Icons.man_2_outlined ,
                                  color:Color.fromARGB(116, 19, 79, 92), 
                                )
                               ),
                              ),
               ),
                          const SizedBox(
                            height: 10,
                          ),

                       Padding(
                        padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! *0,
                    horizontal: SizeConfig.defaultSize! * 0),
                         child: TextFormField(
                          obscureText:true ,
                          style:const TextStyle(color: Color(0xff090F0F)),
                              decoration: InputDecoration(
                                fillColor: const Color(0xFFFFFFFF),
                                filled: true,
                                hintText: 'Password',
                               hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                   fontSize: 14,
                                 color: Color.fromARGB(116, 19, 79, 92),
                                  fontWeight: FontWeight.w600,
                                     ),
                                enabledBorder: border,
                                focusedBorder: border,
                                prefixIcon:const Icon(
                                Icons.email,
                                  color: Color.fromARGB(116, 19, 79, 92),
                                      ),
                               ),
                              ),
                       ),
                            
                  const  SizedBox(
                    height: 10,
                   ) ,
                    Padding(
                     padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 0,
                    horizontal: SizeConfig.defaultSize! * 0),
                      child: TextFormField(
                          obscureText:true ,
                          style:const TextStyle(color: Color(0xff090F0F)),
                              decoration: InputDecoration(
                                fillColor: const Color(0xFFFFFFFF),
                                filled: true,
                                hintText: 'Password',
                               hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                   fontSize: 14,
                                 color: Color.fromARGB(116, 19, 79, 92),
                                  fontWeight: FontWeight.w600,
                                     ),
                                enabledBorder: border,
                                focusedBorder: border,
                                prefixIcon:const Icon(
                                Icons.vpn_key,
                                  color: Color.fromARGB(116, 19, 79, 92),
                                      ),
                               ),
                              ),
                    ),      // Add more widgets as needed for the sign-up form
                          ],
                        ),
      ),
    ),
      ],
    );
  }
}
