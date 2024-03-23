import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPets extends StatelessWidget {
  const AddPets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEEEFEF),
        scrolledUnderElevation: 0,
        toolbarHeight: 0.h,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xffEEEFEF),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 250.h,
                        width: 250.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/image/Group998.png',),
                            fit: BoxFit.fill
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 5,
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 0.5,
                              color: Colors.white,
          
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10 ,
                                color: Colors.black.withOpacity(0.13),
                                offset: const Offset(0, 10),
                              )
                            ],
                            color:const  Color(0xff80CBC4),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: Color.fromARGB(190, 0, 0, 0),
                          ),
                        )
                        ),
                    ],
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                    'MAIN INFORMATION',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 70.sp,
                      color: const Color(0xff80cbc4),
                      fontWeight: FontWeight.w700,
                      shadows: [
                        Shadow(
                          color: const Color(0xa1000000),
                         
                           offset: const Offset(0, 3),
                          blurRadius: 6.r,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                  //1
                  Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 5),
                       // labelText: 'Pet Name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText:'Pet Name',
                        hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 35.sp,
                        color: const Color.fromARGB(126, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(width: 1)
                        )
                      ),
                    ),
                  ),
                  //2
                  Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                       
                        contentPadding: const EdgeInsets.only(left: 5),
                       // labelText: 'Pet Name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText:'Pet Type',
                        hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 35.sp,
                        color: const Color.fromARGB(126, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        ),
                       focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(width: 1)
                        )
                      ),
                    ),
                  ),
                  //3
                   Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                       
                        contentPadding: const EdgeInsets.only(left: 5),
                       // labelText: 'Pet Name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText:'Pet Type',
                        hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 35.sp,
                        color: const Color.fromARGB(126, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        ),
                     focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(width: 1)
                        )
                      ),
                    ),
                  ),

                //4
                  Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                    child: TextField(
                      decoration: InputDecoration(

                       
                        contentPadding: const EdgeInsets.only(left: 5),
                       // labelText: 'Pet Name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText:'Pet Type',
                        hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 35.sp,
                        color: const Color.fromARGB(126, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        ),
                       enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.0, // Set the width of the border here
        ),
      ),
                      ),
                    ),
                  ),
                  //5
                   Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                       
                        contentPadding: const EdgeInsets.only(left: 5),
                       // labelText: 'Pet Name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText:'Pet Type',
                        hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 35.sp,
                        color: const Color.fromARGB(126, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0
                          )
                        )
                      ),
                    ),
                  ),
                  //6
                  Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                       
                        contentPadding: const EdgeInsets.only(left: 5),
                       // labelText: 'Pet Name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText:'Pet Type',
                        hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 35.sp,
                        color: const Color.fromARGB(126, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(width: 1)
                        )
                      ),
                    ),
                  ),
                ],
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}