import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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

          //to build the card of pets
          Flexible(
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
                            cardHeight: index % 2 == 0 ? 0.26841 : 0.3694,
                            imageHeight: index % 2 == 0 ? 0.14966 : 0.20000,
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
                            cardHeight: index % 2 == 0 ? 0.3694 : 0.26841,
                            imageHeight: index % 2 == 0 ? 0.2 : 0.14966,
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

class BuildPetCard extends StatelessWidget {
  const BuildPetCard({
    super.key,
    required this.petsInfo,
    required this.cardHeight,
    required this.imageHeight,
  });
  final PetsInformation petsInfo;
  final double cardHeight;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    // Check if the image URL is a local asset path

    //String? profileImageUrl = userData['profileImageUrl'];
    return Container(
      height: size.height <= 707.4285714285714
          ? size.height * cardHeight
          : size.height * cardHeight,
      width: size.width * 0.41122,
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
            // Adjust the radius value as needed
            IconButton(
              iconSize: size.width * 0.037,
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.025),
                child: petsInfo.imageUrl.startsWith('profile_image')
                    ? Image.network(
                        petsInfo.imageUrl,
                        width: double.infinity,
                        height: imageHeight,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        petsInfo.imageUrl,
                        width: double.infinity,
                        height: imageHeight,
                        fit: BoxFit.cover,
                      ),
              ),
              onPressed: () {
                Get.to(
                  PetProfilePage(petInformation: petsInfo),
                  transition: Transition.zoom,
                );
              },
            ),
            Text(
              petsInfo.petName,
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
              petsInfo.petGender,
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: size.width * 0.040,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(166, 74, 94, 124),
                letterSpacing: 0.5,
              ),
            ),
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
