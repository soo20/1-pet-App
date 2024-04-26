// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petapplication/pages/setting_bage/setting.dart';


bool isEmail(String input) => EmailValidator.validate(input);
bool isPhone(String input) =>
    RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
        .hasMatch(input);

class EditAcount extends HookWidget {
  EditAcount({super.key});

 String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : 'enter your email';
}
final _formKey = GlobalKey<FormState>();
final _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

   
    final key = useState(GlobalKey<FormFieldState>());
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.r),
        borderSide: const BorderSide(
            width: 0.5, color: Color.fromARGB(70, 112, 112, 112)));

    return 
       Scaffold(
         backgroundColor: const Color(0xffB5C0D0),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 110.h,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/trash.svg', width: 120.w),
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
          
               
          child: Column(
            
            children: [
                 Padding(
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
                      color: const Color.fromARGB(255, 161, 13, 18),
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
            const SizedBox(height:45 ,),
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
            child: Form(
         key: _formKey,
              child: TextFormField(
                  
                controller: nameController,
                 validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
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
                    color: Color.fromARGB(116, 19, 79, 92),
                  ),
                ),
                
               
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 15,bottom: 15),
            child: Form(
              key: _formKey2,
               autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                controller: emailController,
                validator: validateEmail,
                
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
                    color: Color.fromARGB(116, 19, 79, 92),
                  ),
                ),
               
              
              ),
            ),
          ),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: TextFormField(
                  controller: phoneNumberController,
                  key: key.value,
                  validator: (value) {
                    if (!isPhone(value!)) {
                      return 'Enter Valid phone number.';
                    }
                    return'enter your phone number' ;
                  },
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
                    color: Color.fromARGB(116, 19, 79, 92),
                  ),
                ),
                ),
              ),
              const SizedBox(height: 60.0),
              ElevatedButton(
                onPressed: () {
                  if (key.value.currentState!.validate() ||_formKey.currentState!.validate()||_formKey2.currentState!.validate()) {
                    Get.to(()=>
                Setting(
                  ccontext: context,
                ),
                transition: Transition.zoom,
              );
                  }
                },
                style: ButtonStyle(
                 
                    padding: MaterialStateProperty.all(const EdgeInsets.only(left: 50,right: 50,top: 15,bottom: 15)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(const Color.fromARGB(255, 161, 13, 18))),
                child: const Text('Next', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
               ),
       );
  }
}