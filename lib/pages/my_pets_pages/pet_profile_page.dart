// ignore_for_file: unused_element, must_be_immutable, unused_field, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';
import 'package:petapplication/pages/info_page/information.dart';
import 'package:petapplication/pages/my_pets_pages/diseases_information_page.dart';

import 'package:petapplication/pages/pet_setting_pages/edit_page.dart';
import 'package:petapplication/some_files_to_data/adding_pet_to_firestore.dart';

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
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    // Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool v) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const TheMainHomePage(
                    index1: 0,
                  )),
          (Route<dynamic> route) => false,
        );
      },
      child: Scaffold(
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
                      ? size.height * 0.04
                      : size.height * 0.047,
                ),
                ClipOval(
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('pets')
                        .doc(widget.petInformation.petId)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                                'Failed to load your profile photo, please try again later.'),
                            action: SnackBarAction(
                                label: 'Close',
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                }),
                          ),
                        );

                        return Container(
                          width: size.width * 0.7,
                          height: size.height * 0.37,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/image/profileImage.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 25, right: 0, left: 0.6),
                          child: CircleAvatar(
                            radius: height * 0.185,
                            foregroundImage: snapshot.data?['imageUrl'] != null
                                ? NetworkImage(snapshot.data!['imageUrl'])
                                : null,
                            backgroundImage: const AssetImage(
                                'assets/image/profileImage.png'),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
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
                  padding: EdgeInsets.only(
                      bottom: size.height * 0.01,
                      left: size.width * 0.1,
                      right: size.width * 0.1),
                  child: Text(
                    '${widget.petInformation.petType} | ${widget.petInformation.petGender} | ${widget.petInformation.age}',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.0548,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(105, 74, 94, 124),
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color?>(
                        const Color(0xffA26874),
                      ),
                      foregroundColor: WidgetStateProperty.all<Color?>(
                        const Color(0xffF3F2F2),
                      ),
                      textStyle: WidgetStateProperty.all<TextStyle?>(
                        TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.059,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                        ),
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust the border radius here
                        ),
                      ),
                      elevation:
                          WidgetStateProperty.all<double>(size.width * 0.01)),
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
                        backgroundColor: WidgetStateProperty.all<Color?>(
                          const Color(0xffB5C0D0),
                        ),
                        foregroundColor: WidgetStateProperty.all<Color?>(
                          const Color(0xffF3F2F2),
                        ),
                        textStyle: WidgetStateProperty.all<TextStyle?>(
                          TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: size.width * 0.059,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5,
                          ),
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust the border radius here
                          ),
                        ),
                        elevation:
                            WidgetStateProperty.all<double>(size.width * 0.01)),
                    onPressed: () {
                      Get.to(
                          () => InfoPage(
                                petType: widget.petInformation.petType,
                                petIsDogOrCat:
                                    widget.petInformation.petIsDogOrCat!,
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
                      backgroundColor: WidgetStateProperty.all<Color?>(
                        const Color(0xff4A5E7C),
                      ),
                      foregroundColor: WidgetStateProperty.all<Color?>(
                        const Color(0xffF3F2F2),
                      ),
                      textStyle: WidgetStateProperty.all<TextStyle?>(
                        TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.059,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                        ),
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ), // Adjust the border radius here
                        ),
                      ),
                      elevation:
                          WidgetStateProperty.all<double>(size.width * 0.01)),
                  onPressed: () {
                    Get.to(
                      DiseasesInformationForPet(
                        poopDetectionResult:
                            widget.petInformation.poopDiseaseType,
                        skinDetectionResult:
                            widget.petInformation.skinDiseaseType,
                        petId: widget.petInformation.petId,
                        petInfo: widget.petInformation,
                      ),
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
      ),
    );
  }
}
