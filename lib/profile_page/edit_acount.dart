// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petapplication/profile_page/user_profile.dart';



//bool isPhone(String input) => RegExp(r'^01[0-9]{9}$').hasMatch(input);

class EditAcount extends StatefulWidget {
  const EditAcount({super.key});


  @override
  State<EditAcount> createState() => _EditAcountState();
}

class _EditAcountState extends State<EditAcount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'enter your email please';
    } else {
      // Regular expression to validate email format
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      if (!regex.hasMatch(value)) {
        return 'Invalid email';
      }
    }
    return null; // Return null if the email is valid
  }

  final _formKey = GlobalKey<FormState>();



  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.r),
        borderSide: const BorderSide(
            width: 0.5, color: Color.fromARGB(70, 112, 112, 112)));

    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 110.h,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/trash.svg', width: 120.w,color: const Color(0XFFA26874),),
            onPressed: () {
              nameController.clear();
              emailController.clear();
              phoneNumberController.clear();
            },
          ),
        ],
        iconTheme: const IconThemeData(
          color: Color(0xff707070),
          size: 50.0,
        ),
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: 35),
        width: 500,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/background_ofedit_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                
                },
              
          
              child :Padding(
                padding: const EdgeInsets.only(top: 0, right: 150),
                child: Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/Group998.png'))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 65, top: 70, right: 6),
                    child: Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.1,
                          color: const Color(0xff707070),
                        ),
                        color: const Color(0XFFA26874),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.only(right: 10),
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          //size: 21,
                          color: const Color(0xffEEEEEE),
                          shadows: [
                            BoxShadow(
                              spreadRadius: 15,
                              blurRadius: 20,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ),
              const SizedBox(
                height: 45,
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 115.sp,
                    color: const Color(0xff354A6B),
                    height: .970873786407767.h,
                  ),
                  children: const [
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
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
              SizedBox(
                height: 70.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: TextFormField(
                  controller: nameController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please Enter your name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  keyboardAppearance: Brightness.dark,
                  obscureText: false,
                  style:  TextStyle( 
                    color: const  Color.fromARGB(255, 37, 40, 50),
                      fontFamily: 'Cosffira',
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFFFFFFF),
                    contentPadding: const EdgeInsets.symmetric(vertical: 17,horizontal: 18),
                    filled: true,
                    
                    //hintText: 'Name',
                    hintText: 'Name',
                      
                    hintStyle: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 60.sp,
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
                padding: const EdgeInsets.only(
                    left: 35, right: 35, top: 15, bottom: 15),
                child: TextFormField(
                  controller: emailController,
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                 style:  TextStyle( 
                    color: const  Color.fromARGB(255, 37, 40, 50),
                      fontFamily: 'Cosffira',
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFFFFFFF),
                    contentPadding: const EdgeInsets.symmetric(vertical: 17,horizontal: 18),
                    filled: true,
                    hintText: 'Email',
                 hintStyle: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 51.sp,
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
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                   style:  TextStyle( 
                    color: const  Color.fromARGB(255, 37, 40, 50),
                      fontFamily: 'Cosffira',
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFFFFFFF),
                    contentPadding: const EdgeInsets.symmetric(vertical: 17,horizontal: 18),
                    filled: true,
                   hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 51.sp,
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
              const SizedBox(height: 60.0),
              ElevatedButton(
                onPressed: () {
                 // Get the data from the text controllers
              String name = nameController.text;
              String email = emailController.text;
              String phoneNumber = phoneNumberController.text;
                  if (_formKey.currentState!.validate() ) {
                  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  UserAcount(
               name: name,
             email: email,
            phoneNumber: phoneNumber,
              ),
            ),
          );
                  }
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(
                        left: 50, right: 50, top: 15, bottom: 15)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0XFFA26874),)),
                child:  Text('Finish', style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 51.sp,
                        color: const Color(0XFFeeeeee),
                        fontWeight: FontWeight.w800,
                      ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
