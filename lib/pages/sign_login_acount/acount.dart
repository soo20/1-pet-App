import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/sign_login_acount/popup_surface.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    double aspectRatio = screenHeight / screenWidth;
    return Scaffold(
      backgroundColor: const Color(0xffB8D8D4),
      appBar: AppBar(
        
        elevation: 0,
        
         automaticallyImplyLeading: false,
        //iconTheme: IconThemeData.fallback(),
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 47,
        actions: [
          IconButton(
              icon: SvgPicture.asset('assets/icons/trash.svg'
              ,width: 30,height: 40,),
              onPressed: () {},
                // Add your search action here
                ), ],
              iconTheme:const  IconThemeData(

            color: Color(0xff707070), // Set the color of the icons
            size: 50.0, 
           
                  // Set the size of the icons
          ),
        

        
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          
          Positioned(
            top: -25,
            right: 110,
            width: 300,
            child: 
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: const EdgeInsets.only(left: 50,bottom: 00
                ,right: 100,top: 0),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(children: [
                    Stack(
                      children: [
                      Container(
                        width: 200,
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4,color:Colors.white ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.2)
              
                            )
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage
                          (fit: BoxFit.contain,
                            image: AssetImage('assets/image/Group998.png')
                             )
                        ),
                       
                        ),
                        Positioned(
                          bottom: 0,
                          right: 25,
                          child: Container(
                            height: 30,
                            width: 28,
                            decoration: BoxDecoration(
                              boxShadow: [
                            BoxShadow(
                              spreadRadius: 5,
                              blurRadius: 20,
                              color: Colors.black.withOpacity(0.1)
              
                            )
                          ],
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 0.1,
                                color: const Color(0xff707070),
                              ),
                              color: const Color(0xff80CBC4),
                             
                            ),
                            child: Icon(
                              Icons.add,
                              size: 21,
                              color: const Color(0xff2E5950),
                              shadows: [
                            BoxShadow(
                              spreadRadius: 15,
                              blurRadius: 20,
                              color: Colors.grey.withOpacity(0.1)
              
                            )
                          ],
                            ),
                          )) 
                         
                      ],),
                    ],),
                  ),
                ),
            ),
          ),
           Positioned.fill(
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: content(),
            ),
          ),
        
        ],
      ),
        
    );
  }

  Widget content() {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(19),
        borderSide: const BorderSide(
            width: 1.0, color: Color.fromARGB(70, 112, 112, 112)));

    return Align(
      alignment: Alignment.bottomCenter,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
            padding: const EdgeInsets.fromLTRB(00.0, 15.0, 0.0, 00.0),
              child: SvgPicture.string(
                '<svg viewBox="0.0 0.0 1080.0 1776.0" ><path transform="translate(0.0, 201.96)" d="M 285.8271484375 166.3972778320312 C 85.981689453125 104.1020584106445 1.4736328125 -201.95654296875 1.4736328125 -201.95654296875 L 0 1574.04345703125 L 1080 1574.04345703125 L 1080 298.3213500976562 C 1080 243.4685974121094 999.398681640625 80.20536041259766 800.85546875 47.22433471679688 C 602.312255859375 14.24331855773926 485.672607421875 228.6924743652344 285.8271484375 166.3972778320312 Z" fill="#f3f2f2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>',
                allowDrawingOutsideViewBox: false,
                fit: BoxFit.cover,
                excludeFromSemantics: true,
                clipBehavior: Clip.none,
                matchTextDirection: false,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.1,
                  right: screenWidth * 0.045,
                  left: screenWidth * 0.045),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                     const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 40,
                      color:  Color(0xff134f5c),
                      height: 0.970873786407767,
                    ),
                    children: [
                      TextSpan(
                        text: 'My ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'account',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                             const  SizedBox(height: 20,),
                    TextField(
                      obscureText: false,
                      style: const TextStyle(color: Color(0xff090F0F)),
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFFFFFFF),
                        filled: true,
                        hintText: 'Name',
                        hintStyle: const TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 16,
                          color: Color.fromARGB(116, 19, 79, 92),
                          fontWeight: FontWeight.w800,
                        ),
                        enabledBorder: border,
                        focusedBorder: border,
                        prefixIcon: const Icon(
                          Icons.man_sharp,
                            
                          color: Color.fromARGB(116, 19, 79, 92),
                        ),
                      ),
                    ),
                   const  SizedBox(height: 15,),
                    TextField(
                      obscureText: false,
                      style: const TextStyle(color: Color(0xff090F0F)),
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFFFFFFF),
                        filled: true,
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 16,
                          color: Color.fromARGB(116, 19, 79, 92),
                          fontWeight: FontWeight.w800,
                        ),
                        enabledBorder: border,
                        focusedBorder: border,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(116, 19, 79, 92),
                        ),
                      ),
                    ),
                
                    const  SizedBox(height: 15,),
                    TextField(
                      obscureText: false,
                      style: const TextStyle(color: Color(0xff090F0F)),
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFFFFFFF),
                        filled: true,
                        hintText: 'Phone Number',
                        hintStyle: const TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 17,
                          color: Color.fromARGB(116, 19, 79, 92),
                          fontWeight: FontWeight.w800,
                        ),
                        enabledBorder: border,
                        focusedBorder: border,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color.fromARGB(116, 19, 79, 92),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.048,
                      width: 0,
                    ),
                    CustomGeneralButtom(
                      boxColor: const Color(0xffB8D8D4),
                      textColor: const Color(0xff134F5C),
                      height: screenHeight * 0.025,
                      width: SizeConfig.defaultSize! * 14,
                      borderColor: const Color.fromARGB(60, 112, 112, 112),
                      text: 'Finish',
                       onTap: () {
                            Get.to(() => const Serface(),transition: Transition.zoom );
                          },
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
