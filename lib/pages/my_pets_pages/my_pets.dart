import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petapplication/pages/my_pets_pages/pet_profile_page.dart';
import 'package:petapplication/pages/events_system/events_for_pet.dart';

class PetsInformation {
  PetsInformation({
    required this.imageUrl,
    required this.petName,
    required this.petGender,
    required this.petId,
    required this.petType,
    required this.age,
  });
  late String imageUrl;
  late String petName;
  late String petGender;
  late String petId;
  late String petType;
  late String age;
  String skinDiseaseType = '';
  String poopDiseaseType = '';
  List<CustomTime> feedTimesForPet = [];
  List<ReminderData> remindersData = [];
}

List<PetsInformation> catsInformationList = [
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/cat1.jpeg',
    petName: 'Luna',
    petGender: 'female',
    petId: '1',
    petType: 'Domestic Shorthair',
    age: '2 years',
  ),
  PetsInformation(
      imageUrl: 'assets/image/my_pets_page_images/cat2.jpeg',
      petName: 'Oliver',
      petGender: 'male',
      petId: '2',
      petType: 'Maine Coon',
      age: '2 years'),
  PetsInformation(
      imageUrl: 'assets/image/my_pets_page_images/cat3.jpeg',
      petName: 'Bella',
      petGender: 'male',
      petId: '3',
      petType: "Siamese",
      age: '2 years'),
  PetsInformation(
      imageUrl: 'assets/image/my_pets_page_images/cat4.jpeg',
      petName: 'Simba',
      petGender: 'female',
      petId: '4',
      petType: 'Persian',
      age: '2 years'),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/cat5.jpeg',
    petName: 'Lucy',
    petGender: 'male',
    petId: '5',
    petType: 'Ragdoll',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/cat6.jpeg',
    petName: 'Chloe',
    petGender: 'female',
    petId: '6',
    petType: 'British Shorthair',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/cat7.jpg',
    petName: 'Milo',
    petGender: 'male',
    petId: '7',
    petType: 'Sphynx',
    age: '2 years',
  ),
  PetsInformation(
      imageUrl: 'assets/image/my_pets_page_images/cat8.jpeg',
      petName: 'Daisy',
      petGender: 'female',
      petId: '8',
      petType: 'Bengal',
      age: '2 years'),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/cat9.jpg',
    petName: 'lulli',
    petGender: 'male',
    petId: '9',
    petType: 'Abyssinian',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/wite cat.jpg',
    petName: 'julli',
    petGender: 'female',
    petId: '10',
    petType: 'Scottish Fold',
    age: '2 years',
  ),
];

List<PetsInformation> dogsInformationList = [
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/golden-retriever.jpeg',
    petName: 'Max',
    petGender: 'female',
    petId: '11',
    petType: 'Golden Retriever',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/dog1.jpeg',
    petName: 'Buby',
    petGender: 'female',
    petId: '12',
    petType: 'German Shepherd',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/dog2.jpeg',
    petName: 'Charlie',
    petGender: 'male',
    petId: '13',
    petType: 'Labrador Retriever',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/dog3.jpeg',
    petName: 'Jack',
    petGender: 'male',
    petId: '14',
    petType: 'Bulldog',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/dog4.jpeg',
    petName: 'Cooper',
    petGender: 'female',
    petId: '15',
    petType: 'Beagle',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/dog5.jpeg',
    petName: 'Rocky',
    petGender: 'male',
    petId: '16',
    petType: 'Poodle',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/dog6.jpeg',
    petName: 'Bear',
    petGender: 'female',
    petId: '17',
    petType: 'Boxer',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/dog7.jpeg',
    petName: 'Tucker',
    petGender: 'male',
    petId: '18',
    petType: 'Siberian Husky',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/dog8.jpeg',
    petName: 'Oliver',
    petGender: 'female',
    petId: '19',
    petType: 'Dachshund',
    age: '2 years',
  ),
  PetsInformation(
    imageUrl: 'assets/image/my_pets_page_images/dog9.jpeg',
    petName: 'Duke',
    petGender: 'female',
    petId: '20',
    petType: 'Shih Tzu',
    age: '2 years',
  ),
];

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
List<dynamic> petsList = List.from(dogsInformationList)
  ..addAll(catsInformationList);

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

  // Index variable for the bottom navigation bar

  // Build the UI for the home page
  @override
  Widget build(BuildContext context) {
    // Calculate the height of the event container based on the screen size
    size = MediaQuery.of(context).size;
    double widthOfpressing = size.width * 0.200;
    double heighthOfpressing = size.height * 0.200;
    final double eventHeight;
    petsList.shuffle(Random());
    if (size.height <= 707.4285714285714) {
      eventHeight = MediaQuery.of(context).size.height * 0.21 - 50;
    } else {
      eventHeight = MediaQuery.of(context).size.height * 0.23 - 40;
    }
    // Scaffold widget containing the app structure
    return
        // Body of the app containing various UI elements
        Container(
      height: size.height,
      margin: EdgeInsets.all(size.height * 0.008),
      child: Column(
        children: <Widget>[
          AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: closeTopevents ? 0 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: size.width,
              alignment: Alignment.topCenter,
              // When we scroll, the reminders feature events will appear at a height of 0.
              height: closeTopevents ? 0 : eventHeight,
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
                        fit: BoxFit.fill,
                        width: allTypes ? widthOfpressing : size.width * 0.160,
                        height:
                            allTypes ? heighthOfpressing : size.height * 0.130,
                      ),
                      onPressed: () {
                        setState(() {
                          pressedOnAllButton = 'after_pressing';
                          pressedOnDogsButton = 'before_pressing';
                          pressedOnCatsButton = 'before_pressing';
                          petsList = List.from(dogsInformationList)
                            ..addAll(catsInformationList);

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
                        fit: BoxFit.fill,
                      ),
                      onPressed: () {
                        setState(() {
                          pressedOnAllButton = 'before_pressing';
                          pressedOnDogsButton = 'after_pressing';
                          pressedOnCatsButton = 'before_pressing';
                          petsList = dogsInformationList;
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
                          petsList = catsInformationList;
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
          ),
          //to build the card of pets
          Expanded(
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
              ),
            ),
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
    return Container(
      height: size.height <= 707.4285714285714
          ? size.height * cardHeight
          : size.height * cardHeight,
      width: size.width * 0.41122,
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(size.width * 0.025)),
        color: const Color(0xffDCD3D3),
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 138, 138, 138),
              blurRadius: size.width * 0.010),
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
                child: Image.asset(
                  petsInfo.imageUrl,
                  width: size.width * 0.99472,
                  height: size.height * imageHeight,
                  fit: BoxFit.fill,
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
                fontFamily: 'Cosffira',
                fontSize: size.width * 0.060,
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(255, 205, 64, 97),
                letterSpacing: 0.5,
              ),
            ),
            Text(
              petsInfo.petGender,
              style: TextStyle(
                fontFamily: 'Cosffira',
                fontSize: size.width * 0.040,
                fontWeight: FontWeight.w700,
                color: const Color(0xff2A606C),
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List petsOnTheRight(List<dynamic> p) {
  List returnedList = [];
  for (int i = 0; i < (p.length ~/ 2).toInt(); i++) {
    returnedList.add(p[i]);
  }
  return returnedList;
}

List petsOnTheLeft(List<dynamic> p) {
  List returnedList = [];
  for (int i = (p.length ~/ 2).toInt(); i < p.length; i++) {
    returnedList.add(p[i]);
  }
  return returnedList;
}
