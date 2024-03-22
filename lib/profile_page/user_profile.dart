
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';



class ClipTry extends StatefulWidget {
  const ClipTry({super.key});

  @override
  State<ClipTry> createState() => _ClipTryState();
}

class _ClipTryState extends State<ClipTry> {
    bool _obscureText3 = true;
  @override
  Widget build(BuildContext context) {
      var emailController = TextEditingController();
    var passController = TextEditingController();
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: const BorderSide(
            width: 0.5, color: Color.fromARGB(70, 112, 112, 112)));

    return Scaffold(
      backgroundColor: const Color(0xffEEEFEF),
      body: Stack(
        children: [
         Positioned(
          top: 0,
           child: Image.asset(
             "assets/image/Path44.png",
           width: 1250.w,
           
            
             fit: BoxFit.contain, // Adjust the fit as needed
           ),
         ),
           
           Padding(
             padding: const EdgeInsets.only(top: 140.0,right: 120,left: 174),
             child: Container(
                          width: 290.w,
                          height: 320.h,
                        padding: const EdgeInsets.only(bottom:100 ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 8,color:const Color(0xFFFFFFFF),),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0,
                                blurRadius: 0,
                                color: Colors.black.withOpacity(0.0)
                
                              )
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage
                            (fit: BoxFit.contain,
                              image: AssetImage('assets/image/Group998.png',)
                               )
                          ),
                         
                          ),
           ),
        
        Column(
          children: [
            SizedBox(height: 700.h,),
            Container(
              decoration:
                  BoxDecoration( boxShadow: [
                BoxShadow(
                    blurRadius: 120.r,
                    spreadRadius: 10.r,
                  // offset: const Offset(0, 10),
                    color: Colors.grey.withOpacity(0.1)
                    )
              ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35,20,35,20),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  style: const TextStyle(color: Color(0xff090F0F)),
                  decoration: InputDecoration(
                     contentPadding:
                              const EdgeInsets.symmetric(vertical: 20),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                      hintText: ' User Name',
                      hintStyle:  TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 42.sp,
                        color: const Color.fromARGB(116, 19, 79, 92),
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: const Icon(
                        Icons.man_2_sharp,
                        color: Color.fromARGB(116, 19, 79, 92),
                      )),
                ),
              ),
            ),
           SizedBox(
              height: 0.h,
            ),
            Container(
              decoration:
                  BoxDecoration( boxShadow: [
                BoxShadow(
                    blurRadius: 100,
                    spreadRadius: 7.r,
                    offset: const Offset(1, 10),
                    color: Colors.grey.withOpacity(0.2))
              ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35,0,35,0),
                child: TextField(
                  obscureText: _obscureText3,
                  controller: passController,
                  // obscureText: true,
                  style: const TextStyle(color: Color(0xff090F0F)),
                  decoration: InputDecoration(
                     contentPadding:
                              const EdgeInsets.symmetric(vertical: 20),
                  
                    fillColor: const Color(0xFFFFFFFF),
                    filled: true,
                    hintText: 'Email',
                    hintStyle:  TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 42.sp,
                      color: const Color.fromARGB(116, 19, 79, 92),
                      fontWeight: FontWeight.w600,
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
            ),
           
             Container(
              decoration:
                  BoxDecoration( boxShadow: [
                BoxShadow(
                    blurRadius: 120.r,
                    spreadRadius: 10.r,
                  // offset: const Offset(0, 10),
                    color: Colors.grey.withOpacity(0.1))
              ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35,18,35,20),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  style: const TextStyle(color: Color(0xff090F0F)),
                  decoration: InputDecoration(
                     contentPadding:
                              const EdgeInsets.symmetric(vertical: 20),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                      hintText: 'Phone',
                      hintStyle:  TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 42.sp,
                        color: const Color.fromARGB(116, 19, 79, 92),
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color.fromARGB(116, 19, 79, 92),
                      )),
                ),
              ),
            ),
          
          
        ],
              )
        ]
      )
    
    );
  }
}
