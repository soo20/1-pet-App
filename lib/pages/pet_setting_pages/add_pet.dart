// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';

import 'package:petapplication/core/utils/widgets/custom_buttom.dart';

import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';
import 'package:petapplication/pages/my_pets_pages/my_pets.dart';
import 'package:petapplication/some_files_to_data/adding_pet_to_firestore.dart';

class AddPets extends StatefulWidget {
  AddPets({super.key, this.petType});
  String? petType;

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
  TextEditingController weightController = TextEditingController();
  String? selectedPetType; // Variable to store the selected pet type
  bool showSecondContainer = false;
  late final PetsInformation petInformation;
  final _gender = ["Male", "Female"];
  final _petTypeGender = ['Cat', 'Dog'];

  String? _Selected;

  final List<String> petSpecies = [
    "Abyssinian",
    "Bengal",
    "Birman",
    "Bombay",
    "British_Shorthair",
    "Egyptian_Mau",
    "Maine_Coon",
    "Persian",
    "Ragdoll",
    "Russian_Blue",
    "Siamese",
    "Sphynx",
    "american_bulldog",
    "american_pit_bull_terrier",
    "basset_hound",
    "beagle",
    "boxer",
    "chihuahua",
    "english_cocker_spaniel",
    "english_setter",
    "german_shorthaired",
    "great_pyrenees",
    "havanese",
    "japanese_chin",
    "keeshond",
    "leonberger",
    "miniature_pinscher",
    "newfoundland",
    "pomeranian",
    "pug",
    "saint_bernard",
    "samoyed",
    "scottish_terrier",
    "shiba_inu",
    "staffordshire_bull_terrier",
    "wheaten_terrier",
    "yorkshire_terrier"
  ];

  XFile? _selectedImage;

  Future<void> _selectImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
      await _uploadImageToFirebase(pickedImage);
    }
  }

  Future<String> _uploadImageToFirebase(XFile image) async {
    try {
      String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${image.name}';
      Reference storageRef =
          FirebaseStorage.instance.ref().child('pet_images/$fileName');

      await storageRef.putFile(File(image.path));
      String downloadURL = await storageRef.getDownloadURL();
      print('Image uploaded: $downloadURL');
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing information
    if (widget.petType != null) {
      petTypeController.text = widget.petType!;
    } else {
      petTypeController.text = '';
    }
  }

  @override
  void dispose() {
    petTypeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DecorationImage? decorationImage;
    if (_selectedImage != null) {
      decorationImage = DecorationImage(
        image: FileImage(File(_selectedImage!.path)),
        fit: BoxFit.cover,
      );
    } else {
      decorationImage = const DecorationImage(
        image: AssetImage('assets/image/profileImage.png'),
        fit: BoxFit.cover,
      );
    }
    Future<void> _showProgressDialog(BuildContext context) async {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
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
                        child:
                            buildAutocomplete(), // Replace TextFormField with Autocomplete
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
                                width: .8,
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
                          controller: weightController,
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
                        onTap: () async {
                          _showProgressDialog(context);
                          if (_formKey.currentState!.validate()) {
                            String downloadURL =
                                'assets/image/profileImage.png';
                            if (_selectedImage != null) {
                              downloadURL =
                                  await _uploadImageToFirebase(_selectedImage!);
                            }
                            PetsInformation newPet = PetsInformation(
                              imageUrl: downloadURL,
                              petName: petNameController.text,
                              petGender: _Selected!,
                              petId: '', // Initialize petId as an empty string
                              petType: petTypeController.text,
                              age: ageController.text,
                              petIsDogOrCat: selectedPetType!,
                              petWeight: double.tryParse(weightController.text),
                            );

                            // Add the new pet to Firestore
                            await addPetInFireStore(pet: newPet);

                            // Add the new pet to the appropriate list based on petType
                            if (selectedPetType == 'Cat') {
                              catsInformationList.add(newPet);
                            } else {
                              dogsInformationList.add(newPet);
                            }

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TheMainHomePage(index1: 2),
                              ),
                            );
                          } else {
                            // Show error message if image upload fails
                            // You can implement this part based on your UI/UX requirements
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
                  showSecondContainer = false;
                  // hide container when tapped
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
                      onTap: () async {
                        await _selectImageFromGallery();
                      },
                    )
                  ],
                )),
              ),
            )
          : const SizedBox(),
    );
  }

  Widget buildAutocomplete() {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return petSpecies.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        }).toList();
      },
      onSelected: (String selection) {
        petTypeController.text = selection; // Update the text field
        widget.petType = selection; // Update the widget property
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        textEditingController.text = petTypeController
            .text; // Ensure the controller is initialized with the current value
        return TextFormField(
          controller: textEditingController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            return null;
          },
          focusNode: focusNode,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
            petTypeController.text =
                value; // Update the text field on submission
            widget.petType = value; // Update the widget property on submission
          },
          onChanged: (String value) {
            // No setState() here
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10),
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
                width: 0.8,
              ),
            ),
          ),
          style: TextStyle(
            fontFamily: 'Cosffira',
            fontSize: 50.sp,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w400,
          ),
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Material(
          elevation: 4.0,
          child: Container(
            color: const Color(0xffEFE6E5),
            height: 50,
            width:
                0.0, // Ensure the dropdown width matches the text field width
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 25),
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                final String option = options.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    onSelected(option);
                  },
                  child: Container(
                    width: 0,
                    height: 35,
                    child: ListTile(
                      title: Text(
                        option,
                        style: TextStyle(
                          height: 0.0,
                          fontFamily: 'Cosffira',
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffA26874),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
