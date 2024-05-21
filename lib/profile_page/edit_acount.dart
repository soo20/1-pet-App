import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petapplication/profile_page/updating_user_information.dart';
import 'package:petapplication/profile_page/user_profile.dart';
import 'package:petapplication/profile_page/uploading_image_for_user.dart';

class EditAcount extends StatefulWidget {
  const EditAcount({super.key});

  @override
  State<EditAcount> createState() => _EditAcountState();
}

class _EditAcountState extends State<EditAcount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  User? userInfo = FirebaseAuth.instance.currentUser;
  File? _pickedImageFile;
  bool editPageLoading = false;

  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your email, please';
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

  Future<void> _pickedImage(BuildContext context) async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    if (pickedImage != null) {
      setState(() {
        _pickedImageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _loadProfileImage() async {
    final api = FirebaseApiForUserImage();
    final imageUrl = await api.getProfileImage(context);
    setState(() {
      _pickedImageFile = imageUrl != null ? File(imageUrl) : null;
    });
  }

  @override
  void initState() {
    super.initState();
    if (userInfo != null) {
      nameController.text = userInfo!.displayName ?? '';
      emailController.text = userInfo!.email ?? '';
      phoneNumberController.text = userInfo!.phoneNumber ?? '';
      _loadProfileImage();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.r),
        borderSide: const BorderSide(
            width: 0.5, color: Color.fromARGB(70, 112, 112, 112)));

    return Scaffold(
      backgroundColor: const Color(0xffDCD3D3),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 110.h,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/trash.svg',
              width: 120.w,
              color: const Color(0XFFA26874),
            ),
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
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: height * 0.11,
                  backgroundImage:
                      const AssetImage('assets/image/Group 998.png'),
                  foregroundImage: _pickedImageFile != null
                      ? FileImage(_pickedImageFile!)
                      : null,
                ),
                TextButton.icon(
                  icon: Icon(
                    Icons.account_box_rounded,
                    size: width * 0.07,
                    color: const Color(0xffA26874),
                  ),
                  onPressed: () {
                    _pickedImage(context);
                  },
                  label: Text(
                    'Edit Image',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: width * 0.05,
                      color: const Color(0xffA26874),
                      fontWeight: FontWeight.w800,
                      height: 0.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.018,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: TextFormField(
                    controller: nameController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    keyboardAppearance: Brightness.dark,
                    obscureText: false,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 37, 40, 50),
                      fontFamily: 'Cosffira',
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFFFFFFF),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 18),
                      filled: true,
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 60.sp,
                        color: const Color.fromARGB(120, 53, 74, 107),
                        fontWeight: FontWeight.w800,
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: const Icon(
                        Icons.man_sharp,
                        color: Color.fromARGB(120, 53, 74, 107),
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
                    style: TextStyle(
                      color: const Color.fromARGB(255, 37, 40, 50),
                      fontFamily: 'Cosffira',
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFFFFFFF),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 18),
                      filled: true,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 51.sp,
                        color: const Color.fromARGB(120, 53, 74, 107),
                        fontWeight: FontWeight.w800,
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color.fromARGB(120, 53, 74, 107),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 37, 40, 50),
                      fontFamily: 'Cosffira',
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your phone number';
                      }
                      if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFFFFFFF),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 18),
                      filled: true,
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 51.sp,
                        color: const Color.fromARGB(120, 53, 74, 107),
                        fontWeight: FontWeight.w800,
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Color.fromARGB(120, 53, 74, 107),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final imageApi = FirebaseApiForUserImage();
                        String? imageUrl;
                        if (_pickedImageFile != null) {
                          imageUrl = await imageApi.uploadingImageOnFirebase(
                              _pickedImageFile, context);
                        }
                        updateUserInformation(
                          imageUrl: imageUrl,
                          cxt: context,
                          phoneNumber: phoneNumberController.text,
                          name: nameController.text,
                          email: emailController.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserAcount(),
                          ),
                        );
                      } on FirebaseException catch (error) {
                        setState(() {
                          editPageLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error as String),
                          ),
                        );
                      }
                    }
                  },
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all(const EdgeInsets.only(
                          left: 50, right: 50, top: 15, bottom: 15)),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0XFFA26874),
                      )),
                  child: editPageLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Save',
                          style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 62.sp,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w700),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
