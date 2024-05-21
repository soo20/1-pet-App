// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

import 'package:petapplication/profile_page/uploading_image_for_user.dart';

class UserAcount extends StatefulWidget {
  const UserAcount({
    super.key,
  });

  @override
  State<UserAcount> createState() => _UserAcountState();
}

class _UserAcountState extends State<UserAcount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    User? userInfo = FirebaseAuth.instance.currentUser;
    Image? profileImage;

    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.r),
        borderSide: const BorderSide(
            width: 0.0, color: Color.fromARGB(255, 239, 238, 238)));

    return Scaffold(
        backgroundColor: const Color(0xffEEEFEF),
        resizeToAvoidBottomInset: false,
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(userInfo!.uid)
              .snapshots(),
          builder: (cntx, userInfoSnap) {
            if (userInfoSnap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (userInfoSnap.hasError || userInfoSnap.data!.data() == null) {
              return Center(
                child: Text(
                  "something went wrong....",
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: width * 0.06,
                    color: const Color(0xffA26874),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }
            var userData = userInfoSnap.data!.data()!;
            nameController.text = userData['name'] ?? '';
            emailController.text = userData['email'] ?? '';
            phoneNumberController.text = userData['phoneNumber'] ?? '';
            String? profileImageUrl = userData['profileImageUrl'];

            // Fetch and set the profile image

            final imageApi = FirebaseApiForUserImage();
            Future<String?> userImage = imageApi.getProfileImage(context);

            return Container(
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/user_profile_page.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.120,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.1, right: size.width * 0.5),
                    child: CircleAvatar(
                      //color: Colors.amberAccent,

                      foregroundImage: profileImageUrl != null
                          ? Image.network(profileImageUrl) as ImageProvider
                          : const AssetImage('assets/image/Group 998.png'),
                    ),
                  ),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.1,
                          right: size.width * 0.1,
                          left: size.width * 0.1),
                      child: Form(
                        child: TextFormField(
                          // initialValue: 'soha',
                          controller: nameController,

                          keyboardType: TextInputType.name,
                          keyboardAppearance: Brightness.dark,
                          obscureText: false,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 37, 40, 50),
                            fontFamily: 'Cosffira',
                            fontSize: 60.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFFFFFF),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 19),
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
                            border: border,
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
                      padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          right: size.width * 0.1,
                          left: size.width * 0.1),
                      child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: TextFormField(
                            controller: emailController,
                            //validator: validateEmail,

                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 37, 40, 50),
                              fontFamily: 'Cosffira',
                              fontSize: 60.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              fillColor: const Color(0xFFFFFFFF),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 19),
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
                              border: border,
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color(0xffA26874),
                              ),
                            ),
                            enabled: false,
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.03,
                            right: size.width * 0.1,
                            left: size.width * 0.1),
                        child: TextFormField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 37, 40, 50),
                            fontFamily: 'Cosffira',
                            fontSize: 60.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFFFFFF),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 19),
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
                            border: border,
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Color(0xffA26874),
                            ),
                          ),
                          enabled: false,
                        )),
                  ])
                ],
              ),
            );
          },
        ));
  }
}
