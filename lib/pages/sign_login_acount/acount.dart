import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/pet_setting_pages/add_pet.dart';
//import 'package:petapplication/pages/sign_login_acount/popup_surface.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: const Color(0xffB8D8D4),
      appBar: AppBar(
        
        elevation: 0,
        
         automaticallyImplyLeading: false,
        //iconTheme: IconThemeData.fallback(),
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 110.h,
        actions: [
          IconButton(
              icon: SvgPicture.asset('assets/icons/trash.svg'
              ,width: 120.w,),
              onPressed: () {},
                // Add your search action here
                ), ],
              iconTheme:const  IconThemeData(

            color: Color(0xff707070), // Set the color of the icons
            size: 50.0, 
           
                  // Set the size of the icons
          ),
        

        
      ),
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: RenderObject.debugCheckingIntrinsics,
      body: Stack(
        children: [
          
          Positioned(
           
            child: 
            Container(
              width: 1080.w,
              height: 1920.h,
              padding: const EdgeInsets.only(left: 80,bottom: 0
              ,right: 100,top: 0),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                  Stack(
                    children: [
                    Container(
                      width: 270.w,
                      height: 250.h,
                      decoration: BoxDecoration(
                        border: Border.all(width: 20.w,color:Colors.white ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2.r,
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
                        right: 130,
                        child: Container(
                          height: 70.h,
                          width: 88.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                          BoxShadow(
                            spreadRadius: 5.r,
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
                            spreadRadius: 15.r,
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
           Positioned.fill(
          
              child:  SvgPicture.string(
              '<svg viewBox="0.0 0.0 1080.0 1776.0" ><path transform="translate(0.0, 201.96)" d="M 285.8271484375 166.3972778320312 C 85.981689453125 104.1020584106445 1.4736328125 -201.95654296875 1.4736328125 -201.95654296875 L 0 1574.04345703125 L 1080 1574.04345703125 L 1080 298.3213500976562 C 1080 243.4685974121094 999.398681640625 80.20536041259766 800.85546875 47.22433471679688 C 602.312255859375 14.24331855773926 485.672607421875 228.6924743652344 285.8271484375 166.3972778320312 Z" fill="#f3f2f2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>',
             // allowDrawingOutsideViewBox: false,
              fit: BoxFit.cover,
             // excludeFromSemantics: true,
           clipBehavior: Clip.none,
            //  matchTextDirection: false,
              
            ),
            
          ),
           Container(
           padding: const EdgeInsets.only(
               top:145,
               right:0,
               left:0),
               child: content(),
           )
        ],
      ),
        
    );
  }

 Widget content() {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(59.r),
        borderSide: const BorderSide(
            width: 0.5, color: Color.fromARGB(70, 112, 112, 112)));

    return 
     
     Column(
        children: [
            Text.rich(
        TextSpan(
          style: TextStyle(
            fontFamily: 'Cosffira',
            fontSize: 100.sp,
            color:  const Color(0xff134f5c),
            height: .970873786407767.h,
          ),
          children:const  [
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
        textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
        softWrap: false,
      ),
                  SizedBox(height: 80.h,),
          Padding(
            padding: const EdgeInsets.only(left: 35,right:35 ),
            child: TextField(
              obscureText: false,
              style: const TextStyle(color: Color(0xff090F0F)),
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFFFF),
                 contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                filled: true,
                hintText: 'Name',
                hintStyle:  TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 40.sp,
                  color: const Color.fromARGB(116, 19, 79, 92),
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
          ),
         
          Padding(
            padding: const EdgeInsets.only(left:35 ,right: 35,top: 15),
            child: TextField(
              obscureText: false,
              style: const TextStyle(color: Color(0xff090F0F)),
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFFFF),
                 contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                filled: true,
                hintText: 'Email',
                hintStyle:  TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 40.sp,
                  color: const Color.fromARGB(116, 19, 79, 92),
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
          ),
      
          
          Padding(
            padding: const EdgeInsets.only(top: 15,left:35 ,right: 35),
            child: TextField(
              obscureText: false,
              style: const TextStyle(color: Color(0xff090F0F)),
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFFFF),
                 contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                filled: true,
                hintText: 'Phone Number',
                hintStyle:  TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 40.sp,
                  color: const Color.fromARGB(116, 19, 79, 92),
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
          ),
         SizedBox(
            height: 200.h,
            width: 0,
          ),
          CustomGeneralButtom(
            boxColor: const Color(0xffB8D8D4),
            textColor: const Color(0xff134F5C),
            height: 120.h,
            width: 300.w,
            customFontSize: 45.sp,
            borderColor: const Color.fromARGB(60, 112, 112, 112),
            text: 'Finish',
             onTap: () {
                  Get.to(() => const AddPets(),transition: Transition.zoom );
                },
            fontWeight: FontWeight.w800,
          ),
        ],
      
    );
  }
}
