import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petapplication/pages/homepage/home_page_with_navigation.dart';

import 'package:petapplication/pages/my_pets_pages/pet_profile_page.dart';

import 'package:petapplication/some_files_to_data/adding_pet_to_firestore.dart';

List<PetsInformation> catsInformationList = [];

List<PetsInformation> dogsInformationList = [];

class MyPetsPage extends StatefulWidget {
  const MyPetsPage({super.key});
  @override
  State<MyPetsPage> createState() => _MyPetsPage();
}

//some global variables
bool catsOnly = false;
bool dogsOnly = false;
bool allTypes = true;
//to change icon images pased on this variables
String pressedOnAllButton = 'after_pressing';
String pressedOnDogsButton = 'before_pressing';
String pressedOnCatsButton = 'before_pressing';
Size size = Size.zero;
var cnt1 = 0;
var cnt2 = 0;
/*List<PetsInformation> petsList = List.from(dogsInformationList)
  ..addAll(catsInformationList);*/
List<PetsInformation> petsList = [];
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

// State class for the home page
class _MyPetsPage extends State<MyPetsPage> {
  ScrollController controller = ScrollController();
  bool closeTopevents = false;
  double topContainer = 0;
  //display all of the pets on my pets page when the page is initially loaded.

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      // Calculate the ratio of the current scroll offset to a specific value (119 in this case)
      double value = controller.offset / 119;
      // Update the state based on the calculated values
      setState(() {
        // Update the topContainer value with the calculated ratio
        topContainer = value;
        // Update the closeTopevents variable based on the scroll offset
        closeTopevents = controller.offset > 50;
      });
    });
    fetchPets();
  }

  Future<void> fetchPets() async {
    List<PetsInformation> fetchedPets = await fetchUserPets();
    setState(() {
      petsList = fetchedPets;
    });
  }

  Future<void> fetchPetsByType(String type) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('No user is signed in');
      }

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('pets')
          .where('userId', isEqualTo: user.uid) // Filter by userId
          .where('petIsDogOrCat', isEqualTo: type)
          .get();

      List<PetsInformation> fetchedPets = snapshot.docs
          .map((doc) => PetsInformation.fromFirestore(doc))
          .toList();

      setState(() {
        petsList = fetchedPets;
      });
    } catch (e) {
      print('Error fetching pets: $e');
    }
  }
  // Index variable for the bottom navigation bar

  // Build the UI for the home page
  @override
  Widget build(BuildContext context) {
    // Calculate the height of the event container based on the screen size
    size = MediaQuery.of(context).size;
    double widthOfpressing = size.width * 0.200;
    double heighthOfpressing = size.height * 0.200;

    // Scaffold widget containing the app structure
    return
        // Body of the app containing various UI elements
        Container(
      height: size.height,
      margin: EdgeInsets.all(size.height * 0.002),
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            alignment: Alignment.topCenter,
            // When we scroll, the reminders feature events will appear at a height of 0.
            height: size.height * 0.18,
            // We will apply this animation on the 'scrolledEvents' object.
            child: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //to build the navigations button and switch with each other.
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/my_pets_page_icons/all_types_button_$pressedOnAllButton.png',
                      width: allTypes ? widthOfpressing : size.width * 0.160,
                      height:
                          allTypes ? heighthOfpressing : size.height * 0.130,
                    ),
                    onPressed: () {
                      setState(() {
                        pressedOnAllButton = 'after_pressing';
                        pressedOnDogsButton = 'before_pressing';
                        pressedOnCatsButton = 'before_pressing';
                        fetchPets();
                        catsOnly = false;
                        dogsOnly = false;
                        allTypes = true;
                      });
                    },
                  ),

                  IconButton(
                    icon: Image.asset(
                      'assets/icons/my_pets_page_icons/dogs_button_icon_$pressedOnDogsButton.png',
                      width: dogsOnly ? widthOfpressing : size.width * 0.160,
                      height:
                          dogsOnly ? heighthOfpressing : size.height * 0.130,
                    ),
                    onPressed: () {
                      setState(() {
                        pressedOnAllButton = 'before_pressing';
                        pressedOnDogsButton = 'after_pressing';
                        pressedOnCatsButton = 'before_pressing';
                        fetchPetsByType('Dog');
                        catsOnly = false;
                        dogsOnly = true;
                        allTypes = false;
                      });
                    },
                  ),
                  SizedBox(
                    width: size.width * 0.0001,
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/my_pets_page_icons/cats_button_icon_$pressedOnCatsButton.png',
                      width: catsOnly ? widthOfpressing : size.width * 0.160,
                      height:
                          catsOnly ? heighthOfpressing : size.height * 0.130,
                    ),
                    onPressed: () {
                      setState(() {
                        pressedOnAllButton = 'before_pressing';
                        pressedOnDogsButton = 'before_pressing';
                        pressedOnCatsButton = 'after_pressing';
                        fetchPetsByType('Cat');
                        catsOnly = true;
                        dogsOnly = false;
                        allTypes = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          petsList.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: size.height * 0.11),
                  child: Image.asset(
                    'assets/image/my_pets_page_images/emptyPetList.png',
                    height: size.height * 0.4,
                    width: size.height * 0.4,
                  ),
                )
              //to build the card of pets
              : Flexible(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      dragStartBehavior: DragStartBehavior.start,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              for (int index = 0;
                                  index < petsOnTheLeft(petsList).length;
                                  index++)
                                BuildPetCard(
                                  petsInfo: petsOnTheLeft(petsList)[index],
                                  cardHeight: index % 2 == 0 ? 0.4 : 0.4594,
                                  imageHeight:
                                      index % 2 == 0 ? 0.14966 : 0.20000,
                                  index: index,
                                ),
                            ],
                          ),
                          Column(
                            children: [
                              for (int index = 0;
                                  index < petsOnTheRight(petsList).length;
                                  index++)
                                BuildPetCard(
                                  petsInfo: petsOnTheRight(petsList)[index],
                                  cardHeight: index % 2 == 0 ? 0.4594 : 0.4,
                                  imageHeight: index % 2 == 0 ? 0.2 : 0.14966,
                                  index: index,
                                ),
                            ],
                          ),
                        ],
                      )),
                ),
        ],
      ),
    );
  }
}

class BuildPetCard extends StatefulWidget {
  const BuildPetCard({
    super.key,
    required this.petsInfo,
    required this.cardHeight,
    required this.imageHeight,
    required this.index,
  });
  final PetsInformation petsInfo;
  final double cardHeight;
  final double imageHeight;
  final int index;
  @override
  State<BuildPetCard> createState() => _BuildPetCard();
}

class _BuildPetCard extends State<BuildPetCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;

    return Container(
      height: size.height <= 707.4285714285714
          ? size.height * widget.cardHeight
          : size.height * widget.cardHeight,
      width: size.width * 0.42122,
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(size.width * 0.025)),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 138, 138, 138),
              blurRadius: size.width * 0.0030),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.001,
        ),
        child: Column(
          children: [
            IconButton(
              iconSize: MediaQuery.of(context).size.width * 0.037,
              icon: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('pets')
                    .doc(widget.petsInfo.petId)
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
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.025),
                      child: Image.asset(
                        'assets/image/profileImage.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: height * 0.15, // Adjust height as needed
                      ),
                    );
                  } else if (snapshot.hasData &&
                      snapshot.data != null &&
                      snapshot.data!.exists) {
                    final petData =
                        snapshot.data!.data() as Map<String, dynamic>?;
                    String? imageUrl = petData?['imageUrl'];

                    if (imageUrl != null && imageUrl.isNotEmpty) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(size.width * 0.026),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: height * 0.15, // Adjust height as needed
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/image/profileImage.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: height * 0.15, // Adjust height as needed
                            );
                          },
                        ),
                      );
                    } else {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(size.width * 0.026),
                        child: Image.asset(
                          'assets/image/profileImage.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: height * 0.15, // Adjust height as needed
                        ),
                      );
                    }
                  } else {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.025),
                      child: Image.asset(
                        'assets/image/profileImage.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: height * 0.15, // Adjust height as needed
                      ),
                    );
                  }
                },
              ),
              onPressed: () {
                Get.to(
                  PetProfilePage(petInformation: widget.petsInfo),
                  transition: Transition.zoom,
                );
              },
            ),
            Text(
              widget.petsInfo.petName,
              style: TextStyle(
                height: 0.0,
                fontFamily: 'Cosffira',
                fontSize: size.width * 0.060,
                fontWeight: FontWeight.w900,
                color: const Color(0xffA26874),
                letterSpacing: 0.5,
              ),
            ),
            Text(
              widget.petsInfo.petGender,
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: size.width * 0.040,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(166, 74, 94, 124),
                letterSpacing: 0.5,
              ),
            ),
            if (widget.cardHeight > 0.32) SizedBox(height: size.height * 0.06),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () async {
                  bool deletionSuccess = false;

                  try {
                    _showProgressDialog(context);
                    await deletePetInformations(petId: widget.petsInfo.petId)
                        .then((_) {
                      deletionSuccess = true;
                    });
                  } catch (e) {
                    deletionSuccess = false;
                  } finally {
                    Navigator.of(context).pop(); // Close the progress dialog
                  }

                  if (deletionSuccess) {
                    setState(() {
                      petsList.removeWhere(
                          (pet) => pet.petId == widget.petsInfo.petId);
                    });
                    Get.to(
                      () => const TheMainHomePage(
                        index1: 2,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Successfully deleted ${widget.petsInfo.petName}"),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text("Failed to delete ${widget.petsInfo.petName}"),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                },
                icon: Image.asset(
                  'assets/icons/my_pets_page_icons/trash_for_pets.png',
                  width: size.width * 0.13,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<PetsInformation> petsOnTheLeft(List<PetsInformation> pets) {
  return List<PetsInformation>.from(
      pets.where((pet) => pets.indexOf(pet) % 2 == 0));
}

List<PetsInformation> petsOnTheRight(List<PetsInformation> pets) {
  return List<PetsInformation>.from(
      pets.where((pet) => pets.indexOf(pet) % 2 != 0));
}
