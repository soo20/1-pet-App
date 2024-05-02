// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';
import 'package:petapplication/pages/my_pets_pages/my_pets.dart';

class AddPets extends StatefulWidget {
  const AddPets({super.key});

  @override
  State<AddPets> createState() => _AddPetsState();
}

class _AddPetsState extends State<AddPets> {
  //String? _imagePath2;
  final _formKey = GlobalKey<FormState>();
  // TextEditingController imageUrlController = TextEditingController();
  TextEditingController petNameController = TextEditingController();
  TextEditingController petGenderController = TextEditingController();
  TextEditingController petIdController = TextEditingController();
  TextEditingController petTypeController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String? selectedPetType; // Variable to store the selected pet type
  bool showSecondContainer = false;
  late final PetsInformation petInformation;
  final _gender = ["Male", "Female"];
  final _petTypeGender = ['Cat', 'Dog'];

  String?
      _Selected; // Make _Selected nullable againRemove the nullable operator
  //var _currentItemSelected =
  // Function to open the gallery and select an image
  XFile? _selectedImage;
  Future<void> _selectImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    DecorationImage? decorationImage;
    if (_selectedImage != null && File(_selectedImage!.path).existsSync()) {
      decorationImage = DecorationImage(
        image: FileImage(File(_selectedImage!.path)),
        fit: BoxFit.fill,
      );
    } else {
      decorationImage = const DecorationImage(
        image: AssetImage('assets/image/profileImage.png'),
        fit: BoxFit.fill,
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffEFE6E5),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: ListView(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showSecondContainer =
                            !showSecondContainer; // Toggle the visibility of the second container
                      });
                    },
                    child: Container(
                      height: 280.h,
                      width: 270.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // If _imagePath is not null, display the selected image, else display a placeholder
                        image: decorationImage,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 75, left: 75),
                        child: Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 0.5,
                              color: Colors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.13),
                                offset: const Offset(0, 10),
                              )
                            ],
                            color: const Color(0xffA26874),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'MAIN INFORMATION',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: 85.sp,
                      color: const Color(0xff354A6B),
                      fontWeight: FontWeight.w700,
                      shadows: [
                        Shadow(
                          color: const Color(0xa1000000),
                          offset: const Offset(0, 1.5),
                          blurRadius: 6.r,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                  //1
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 10),
                        child: TextFormField(
                          controller: petNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 45.sp,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              // labelText: 'Pet Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'Pet Name',
                              hintStyle: TextStyle(
                                fontFamily: 'Cosffira',
                                fontSize: 45.sp,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffD1D2D2),
                                  width:
                                      0.8, // Set the width of the border here
                                ),
                              )),
                        ),
                      ),
                      //2
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 5),
                        child: TextFormField(
                          controller: petTypeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 50.sp,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              // labelText: 'Pet Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'Pet species',
                              hintStyle: TextStyle(
                                fontFamily: 'Cosffira',
                                fontSize: 45.sp,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffD1D2D2),
                                  width:
                                      0.8, // Set the width of the border here
                                ),
                              )),
                        ),
                      ),
                      //3

                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 10),
                        child: TextFormField(
                          controller: ageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 45.sp,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            // labelText: 'Pet Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Age',
                            hintStyle: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 45.sp,
                              color: const Color.fromARGB(126, 0, 0, 0),
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD1D2D2),
                                width: .8, // Set the width of the border here
                              ),
                            ),
                          ),
                        ),
                      ),
                      // 4

                      /* DropdownButton(
                      value: _Selected,
                         items: _gender.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(),
                           onChanged: (val) {
                    // Handle the onChanged event here
                             setState(() {
                              _Selected = val.toString(); // Update the selected value
                             });
                                 },
                            ),*/
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 10),
                        child: DropdownButtonFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          dropdownColor: const Color(0xffA26874),
                          iconEnabledColor: const Color(0xffA26874),
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 45.sp,
                            color: const Color(0xffF5F5F5),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'pet type',
                            hintStyle: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 45.sp,
                              color: const Color.fromARGB(126, 0, 0, 0),
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD1D2D2),
                                width: .8, // Set the width of the border here
                              ),
                            ),
                          ),
                          value: selectedPetType,
                          items: _petTypeGender
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (val) {
                            // Handle the onChanged event here
                            setState(() {
                              selectedPetType =
                                  val.toString(); // Update the selected value
                            });
                          },
                          selectedItemBuilder: (BuildContext context) {
                            return _petTypeGender.map<Widget>((String item) {
                              return Text(
                                item,
                                style: const TextStyle(color: Colors.black),
                              );
                            }).toList();
                          },
                        ),
                      ),

                      //
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 10),
                        child: DropdownButtonFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          dropdownColor: const Color(0xffA26874),
                          iconEnabledColor: const Color(0xffA26874),
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 45.sp,
                            color: const Color(0xffF5F5F5),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Gender',
                            hintStyle: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 45.sp,
                              color: const Color.fromARGB(126, 0, 0, 0),
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD1D2D2),
                                width: .8, // Set the width of the border here
                              ),
                            ),
                          ),
                          value: _Selected,
                          items: _gender
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (val) {
                            // Handle the onChanged event here
                            setState(() {
                              _Selected =
                                  val.toString(); // Update the selected value
                            });
                          },
                          selectedItemBuilder: (BuildContext context) {
                            return _gender.map<Widget>((String item) {
                              return Text(
                                item,
                                style: const TextStyle(color: Colors.black),
                              );
                            }).toList();
                          },
                        ),
                      ),

                      // 5
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 45.sp,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                          ),
                          //  to take only number
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              // labelText: 'Pet Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'Weight',
                              suffixText: 'In Kg',
                              suffixStyle: TextStyle(
                                fontFamily: 'Cosffira',
                                fontSize: 45.sp,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'Cosffira',
                                fontSize: 45.sp,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffD1D2D2),
                                  width:
                                      0.8, // Set the width of the border here
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      CustomGeneralButtom(
                        boxColor: const Color(0xffA26874),
                        textColor: const Color(0xffFFFFFF),
                        height: 135.h,
                        width: 385.w,
                        borderColor: const Color(0xffA26874),
                        text: 'Finish',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // Ensure that the _selectedImage is not null before proceeding

                            // Create a new PetsInformation object with the entered information
                            PetsInformation newPet = PetsInformation(
                              imageUrl: _selectedImage?.path ??
                                  'assets/image/profileImage.png', // Convert XFile to String path
                              petName: petNameController.text,
                              petGender: _Selected ?? '',
                              petId: petIdController.text,
                              petType: petTypeController.text,
                              age: ageController.text,
                              petIsDogOrCat: selectedPetType!,
                            );

                            // Add the new pet to the appropriate list based on petType
                            if (selectedPetType == 'Cat') {
                              catsInformationList.add(newPet);
                            } else {
                              dogsInformationList.add(newPet);
                            }

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const TheMainHomePage(
                                  index1: 2,
                                ),
                              ),
                            );
                          } else {
                            // Handle the case when form validation fails, if needed
                          }
                        },
                        fontWeight: FontWeight.w500,
                        customFontSize: 50.sp,
                      ),
                    ]),
                  )

                  // Conditional rendering of the shadowed container
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: showSecondContainer
          ? GestureDetector(
              onTap: () {
                setState(() {
                  showSecondContainer = F; // hide container when tapped
                });
              },
              child: Container(
                height: 165,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffDCD3D3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 90,
                      blurRadius: 100,
                      offset: Offset(10, 100), // changes position of shadow
                    ),
                  ],
                ), // Customize as needed
                child: Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomGeneralButtom(
                      boxColor: Color(0xff4A5E7C),
                      textColor: Color(0xffffffff),
                      height: 50,
                      width: 150,
                      borderColor: Color(0xffB5C0D0),
                      customFontSize: 20,
                      // bord: 0.r,
                      fontWeight: FontWeight.normal,
                      text: 'Camera',
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    CustomGeneralButtom(
                      boxColor: const Color(0xffA26874),
                      textColor: const Color(0xffffffff),
                      height: 50,
                      width: 150,
                      //bord: 0.r,
                      borderColor: const Color(0xffEFE6E5),
                      customFontSize: 20,
                      fontWeight: FontWeight.normal,
                      text: 'Gallery',
                      onTap: _selectImageFromGallery,
                    )
                  ],
                )),
              ),
            )
          : const SizedBox(), // Hide the container initially
    );
  }
}
