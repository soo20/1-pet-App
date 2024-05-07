// ignore_for_file: unused_element, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/pages/info_page/information.dart';
import 'package:petapplication/pages/my_pets_pages/diseases_information_page.dart';
import 'package:petapplication/pages/my_pets_pages/my_pets.dart';
import 'package:petapplication/pages/pet_setting_pages/edit_page.dart';

class PetProfilePage extends StatefulWidget {
  PetProfilePage({super.key, required this.petInformation, this.imagePath2});
  PetsInformation petInformation;
  final String? imagePath2;

  @override
  State<PetProfilePage> createState() => _PetProfilePage();
}

class _PetProfilePage extends State<PetProfilePage> {
  XFile? _selectedImage;
  // Add a function to open the device's gallery and select an image
  Future<void> _selectImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        //iconTheme: IconThemeData.fallback(),
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 110.h,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Color(0xffA26874),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EditPets(petInformation: widget.petInformation)),
              ).then((updatedPetInformation) {
                if (updatedPetInformation != null) {
                  // Update pet information on this page
                  setState(() {
                    widget.petInformation = updatedPetInformation;
                  });
                }
              });
            },
            // Add your search action here
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/image/pet_profile_page_images/background_image.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: size.height > 707.4285714285714
                    ? size.height * 0.09
                    : size.height * 0.08,
              ),
              ClipOval(
                child: _selectedImage != null // Check if imagePath is available
                    ? Image.file(
                        File(_selectedImage!
                            .path), // If imagePath is available, use the selected file
                        width: size.width <= 411.42857142857144
                            ? size.width * 0.79472
                            : size.width * 0.66472,
                        height: size.height > 707.4285714285714
                            ? size.height * 0.35472
                            : size.height * 0.36472,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        widget.petInformation
                            .imageUrl, // If imagePath is not available, use the imageUrl from petInformation
                        width: size.width <= 411.42857142857144
                            ? size.width * 0.79472
                            : size.width * 0.66472,
                        height: size.height > 707.4285714285714
                            ? size.height * 0.35472
                            : size.height * 0.36472,
                        fit: BoxFit.fill,
                      ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                widget.petInformation.petName,
                style: TextStyle(
                  height: 0.0,
                  fontFamily: 'Cosffira',
                  fontSize: size.width * 0.168,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xff4A5E7C),
                  letterSpacing: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.03),
                child: Text(
                  '${widget.petInformation.petType} | ${widget.petInformation.petGender} | ${widget.petInformation.age}',
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.0548,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromARGB(105, 74, 94, 124),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      const Color(0xffA26874),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color?>(
                      const Color(0xffF3F2F2),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle?>(
                      TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.059,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.5,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius here
                      ),
                    ),
                    elevation:
                        MaterialStateProperty.all<double>(size.width * 0.01)),
                onPressed: () {
                  Get.to(
                    () => EventsForPetPage(
                      petInformation: widget.petInformation,
                    ),
                    transition: Transition.zoom,
                  );
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.2),
                  child: Image.asset(
                    "assets/icons/pet_profile_page_icons/events_icon.png",
                    width: size.width * 0.07387,
                    height: size.height * 0.06838,
                  ),
                ),
                label: Padding(
                  padding: EdgeInsets.only(
                    right: size.width * 0.2,
                  ), // Adjust the padding to control button width
                  child: const Text('Events'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  bottom: size.height * 0.02,
                ),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color?>(
                        const Color(0xffB5C0D0),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color?>(
                        const Color(0xffF3F2F2),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle?>(
                        TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.059,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust the border radius here
                        ),
                      ),
                      elevation:
                          MaterialStateProperty.all<double>(size.width * 0.01)),
                  onPressed: () {
                    Get.to(
                        () => InfoPage(
                              petType: widget.petInformation.petType,
                            ),
                        transition: Transition.upToDown);
                  },
                  icon: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.17),
                    child: Image.asset(
                      "assets/icons/pet_profile_page_icons/info icon.png",
                      width: size.width * 0.07387,
                      height: size.height * 0.06838,
                    ),
                  ),
                  label: Padding(
                    padding: EdgeInsets.only(
                      right: size.width * 0.17,
                    ), // Adjust the padding to control button width
                    child: const Text('Type Info'),
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      const Color(0xff4A5E7C),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color?>(
                      const Color(0xffF3F2F2),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle?>(
                      TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.059,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.5,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ), // Adjust the border radius here
                      ),
                    ),
                    elevation:
                        MaterialStateProperty.all<double>(size.width * 0.01)),
                onPressed: () {
                  Get.to(
                    DiseasesInformationForPet(
                        poopDetectionResult:
                            widget.petInformation.poopDiseaseType,
                        skinDetectionResult:
                            widget.petInformation.skinDiseaseType),
                  );
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.18),
                  child: Image.asset(
                    "assets/icons/pet_profile_page_icons/Bacterial icon for skin disease.png",
                    width: size.width * 0.07387,
                    height: size.height * 0.06838,
                  ),
                ),
                label: Padding(
                  padding: EdgeInsets.only(
                    right: size.width * 0.18,
                  ), // Adjust the padding to control button width
                  child: const Text('Diseases'),
                ),
              ),
            ],
          ),
        ) /* add child content here */,
      ),
    );
  }
}
