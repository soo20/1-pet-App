
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';



import 'package:flutter_screenutil/flutter_screenutil.dart';





class UserAcount extends StatefulWidget {
   final String? name;
  final String? email;
  final String? phoneNumber;
  final String? userId;

  const UserAcount({super.key, this.name, this.email, this.phoneNumber, this.userId, });

  @override
  State<UserAcount> createState() => _UserAcountState();
}

class _UserAcountState extends State<UserAcount> {
 TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
   
  @override
  @override
void initState() {
    super.initState();
    // Set the initial values of text controllers using widget properties
    nameController.text = widget.name??'soha nagy';
    emailController.text = widget.email??'soha@gmail.com';
    phoneNumberController.text = widget.phoneNumber??'01096702347';
  }


  
  @override
  Widget build(BuildContext context) {
     
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.r),
        borderSide: const BorderSide(
            width: 0.5, color: Color.fromARGB(70, 112, 112, 112)));

    return Scaffold(
      backgroundColor: const Color(0xffEEEFEF),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/user_profile_page.png'),
            fit: BoxFit.fill,
            ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 120,),
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 55),
              child: Container(
                width: 105,
                height: 105,
                
                decoration: const BoxDecoration(
                  //color: Colors.amberAccent,
                    image: DecorationImage(
                        image: AssetImage('assets/image/Group998.png'))),
              )
              ),
             Column(
              children: [
              Padding(
          padding: const EdgeInsets.only(left: 40, right: 40,top: 50),
          child: Form(
    
            child: TextFormField(
               // initialValue: 'soha',
              controller: nameController,
               
              keyboardType: TextInputType.name,
            keyboardAppearance: Brightness.dark,
              obscureText: false,
              style: const TextStyle(color: Color(0xff090F0F)),
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFFFF),
                contentPadding: const EdgeInsets.symmetric(vertical: 19),
                filled: true,
                hintText: 'Name',
                hintStyle: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 48.sp,
                  color: const Color.fromARGB(116, 19, 79, 92),
                  fontWeight: FontWeight.w800,
                ),
                enabledBorder: border,
                focusedBorder: border,
                prefixIcon: const Icon(
                  Icons.man_sharp,
                  color: Color(0xffA26874),
                ),
              ),
              enabled: false,
             
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 18),
          child: Form(
             autovalidateMode: AutovalidateMode.always,
            child: 
               TextFormField(
              controller: emailController,
                //validator: validateEmail,
               
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                style: const TextStyle(color: Color(0xff090F0F)),
                decoration: InputDecoration(
                  fillColor: const Color(0xFFFFFFFF),
                  contentPadding: const EdgeInsets.symmetric(vertical: 19),
                  filled: true,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 48.sp,
                    color: const Color.fromARGB(116, 19, 79, 92),
                    fontWeight: FontWeight.w800,
                  ),
                  enabledBorder: border,
                  focusedBorder: border,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Color(0xffA26874),
                  ),
                ),
               enabled: false,
              
              )
              
            ),
          ),
        
        Padding(
          padding: const EdgeInsets.only(top: 18, left: 40, right: 40),
          child:
             TextFormField(
             controller: phoneNumberController,
            
              keyboardType: TextInputType.number,
              obscureText: false,
              style: const TextStyle(color: Color(0xff090F0F)),
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFFFF),
                contentPadding: const EdgeInsets.symmetric(vertical: 19),
                filled: true,
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: 48.sp,
                  color: const Color.fromARGB(116, 19, 79, 92),
                  fontWeight: FontWeight.w800,
                ),
                enabledBorder: border,
                focusedBorder: border,
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Color(0xffA26874),
                ),
              ),
              enabled: false,
            )
      
          
        ),
              ]
             )
          ],
        ),
      )
    
    );
  }
}
