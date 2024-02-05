
// ignore_for_file: non_constant_identifier_names

/*

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/core/utils/widgets/floating_action.dart';
import 'package:petapplication/core/utils/widgets/space.dart';
import 'package:petapplication/pages/page2/login_info.dart';


class SignUpPody extends StatefulWidget {
const SignUpPody({super.key});

  @override
  State<SignUpPody> createState() => _SignUpPodyState();
  
}

class _SignUpPodyState extends State<SignUpPody> with TickerProviderStateMixin {
   late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;
  bool showButtons = true;
  final PageController _pageController = PageController(initialPage: 0);
  
  int _currentPage = 0;
PageController? pageController;
 
  
 
  void initstate(){
    super.initState();
     _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {

        });
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }
  
  //final TextEditingController _titlecontroller = TextEditingController();
  void showBottomSheet(param0) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(19),
      borderSide: const BorderSide(width: 1.0, color:  Color.fromARGB(70, 112, 112, 112)));
  
    


 
   showModalBottomSheet(
    backgroundColor: const Color.fromARGB(0, 255, 214, 64),
    elevation: 0,
    isScrollControlled: true,
    context: context,
    builder: (_) => 
     
         Container(
          height: 430,
            decoration: const BoxDecoration(
        color: Color(0xffEEEFEF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(80.0),
          topRight: Radius.circular(80.0),
        ),
            ),
             child: SingleChildScrollView(
        
       child : Column(
         
           mainAxisSize: MainAxisSize.min,

           crossAxisAlignment : CrossAxisAlignment.center ,
          children: [
            const SizedBox(
              height: 55,
            ),
           const  Text.rich(
            TextSpan(
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 45,
          color:  Color(0xfff83658),
          height: 1.0434782608695652,
        ),
        children: [
          TextSpan(
            text: 'create ',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: 'an \naccount',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
                              ),
                            ],
                          ),
                        ),
                      
           SizedBox(
            height: 300,
             child: PageView(
              controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
              children:const  [
                MyWidgetForPage(),
                TextFiledForPageView(),
             
              ],
             ),
           ),
         ],
       )
            ),
         ) ,



  

      
  );
}

  
  @override
   Widget build(BuildContext context) {
    double aspectRatio = SizeConfig.screenWidth! / SizeConfig.screenHeight!;
    return AspectRatio(
      aspectRatio: aspectRatio,
      child:Scaffold(
        backgroundColor: kMainColorSplash,
      body :Column(
        children: [
          const VerticalSpace(8.5),
          Text(
            'Yuna\n',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 50,
              color: const Color(0xff0b2f37),
              fontWeight: FontWeight.w600,
              height: SizeConfig.defaultSize! * 0.03,
            ),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 30,
            width: SizeConfig.defaultSize! * 30,
            child: Image.asset('assets/image/Group841.png'),
          ),
          
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.defaultSize! * 1.5,
                  horizontal: SizeConfig.defaultSize! * 8),
              child: const CustomGeneralButtom2(
                height: 42,
                text: 'LOGIN WITH GMAIL',
                textColor: kMainColorPage,
                icon: FontAwesomeIcons.google,
                iconcolor: Color.fromARGB(255, 248, 54, 90),
                boxColor: kMainColor,
                borderColor: kMainColor,
                width: null,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.defaultSize! * 0.001,
                  horizontal: SizeConfig.defaultSize! * 8),
              child: CustomGeneralButtom2(
                height: 42,
                text: 'LOGIN WITH FACEBOOK',
                icon: FontAwesomeIcons.facebook,
                iconcolor: kMainColorPage,
                textColor: kMainColorPage,
                boxColor: kMainColorSplash,
                borderColor: kMainColorPage,
                width: SizeConfig.screenWidth,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.defaultSize! * 1.4,
                  horizontal: SizeConfig.defaultSize! * 8),
              child: CustomGeneralButtom2(
                height: 42,
                text: 'LOGIN WITH EMAIL',
                onTap: () {
                  navigator?.push(
                      MaterialPageRoute(builder: (e) => const LoginInfo()));
                },
                textColor: kMainColorPage,
                icon: FontAwesomeIcons.envelope,
                iconcolor: kMainColorPage,
                boxColor: const Color.fromARGB(255, 248, 54, 90),
                borderColor: const Color.fromARGB(255, 248, 54, 90),
                width: null,
              ),
            ),
          ),
       
       const  Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(width: 100,),
    Text(
      'Don\'t have an account? ',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: Color(0xff090f0f),
        fontWeight: FontWeight.w400,
      ),
    ),
   
     
    
  ],
)

          // Add the rest of your widgets here, for example, text fields, buttons, etc.
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        splashColor: kMainColorSplash,
        highlightElevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 253),
       
        onPressed:() => showBottomSheet(null),
        child: 
        const Text(
        'SignUp',
        style:  TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15.1,
          color: Color(0xff090f0f),
          fontWeight: FontWeight.w900,
        ),
      ),
      ),
        floatingActionButtonLocation: CustomFloatLocation(),
        
    ),
    );
  }
}
class MyWidgetForPage extends StatefulWidget {
  const MyWidgetForPage({super.key});

  @override
  State<MyWidgetForPage> createState() => _MyWidgetForPageState();
}

class _MyWidgetForPageState extends State<MyWidgetForPage> {
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
                   
                child: CustomGeneralButtom2(
                          height: 42,
                          text: 'Cintinue With Email',
                         onTap: () {
                      if (pageController!.page! < 1) {
                        pageController?.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      } else {
                        Get.to(
                          () =>
                              TextFiledForPageView(), // Replace YourNextPage with the actual class for the next page
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 500),
                        );
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
                    );
  }
}
class TextFiledForPageView extends StatefulWidget {
const TextFiledForPageView({super.key});

  @override
  State<TextFiledForPageView> createState() => _TextFiledForPageViewState();
}

class _TextFiledForPageViewState extends State<TextFiledForPageView> {
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
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(19),
      borderSide: const BorderSide(width: 1.0, color:  Color.fromARGB(70, 112, 112, 112)));
    double aspectRatio = screenHeight/screenWidth;
   
    return AspectRatio(
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
    );
  }
}*/