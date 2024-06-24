// ignore_for_file: avoid_print, prefer_conditional_assignment

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/some_files_to_data/feeds_api.dart';

class PetsInformation {
  PetsInformation({
    this.petIsDogOrCat,
    required this.imageUrl,
    required this.petName,
    required this.petGender,
    required this.petId,
    required this.petType,
    this.age,
    this.petWeight,
    required this.poopDiseaseType,
    required this.skinDiseaseType,
  });

  late String imageUrl;
  late String petName;
  late String petGender;
  late String petId;
  late String petType;
  late String? age;
  late String? petIsDogOrCat;
  bool selected = false;
  String skinDiseaseType;
  String poopDiseaseType;
  List<CustomTime> feedTimesForPet = [];
  List<ReminderData> remindersData = [];
  double? petWeight;

  factory PetsInformation.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return PetsInformation(
      imageUrl: data['imageUrl'] ?? '',
      petName: data['petName'] ?? '',
      petGender: data['petGender'] ?? '',
      petId: data['petId'] ?? '',
      petType: data['petType'] ?? '',
      age: data['age'] ?? '',
      petIsDogOrCat: data['petIsDogOrCat'] ?? '',
      petWeight:
          (data['petWeight'] != null) ? data['petWeight'].toDouble() : null,
      skinDiseaseType: data['skin'],
      poopDiseaseType: data['poop'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'imageUrl': imageUrl,
      'petName': petName,
      'petGender': petGender,
      'petWeight': petWeight,
      'petId': petId,
      'petType': petType,
      'age': age,
      'petIsDogOrCat': petIsDogOrCat,
    };
  }
}

Future<void> addPetInFireStore({
  required PetsInformation pet,
}) async {
  try {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('No user is signed in');
    }
// Upload pet image and get the download URL

    // Fetch petIsDogOrCat if not provided
    if (pet.petIsDogOrCat == null) {
      pet.petIsDogOrCat = await fetchPetIsDogOrCat(pet.petType);
    }
    // Reference to the Firestore collection
    CollectionReference petsCollection =
        FirebaseFirestore.instance.collection('pets');

    // Add the pet document with a generated ID
    DocumentReference documentRef = await petsCollection.add({
      'petName': pet.petName,
      'petGender': pet.petGender,
      'petType': pet.petType,
      'age': pet.age,
      'petIsDogOrCat': pet.petIsDogOrCat,
      'petWeight': pet.petWeight,
      'imageUrl': pet.imageUrl,
      'userId': user.uid, // Add current user's ID
    });

    // Update the pet object with the generated ID
    pet.petId = documentRef.id;

    // Optionally, you can update the document with the ID if needed
    await documentRef.update({'petId': pet.petId});

    print('Pet added with ID: ${pet.petId}');
  } catch (e) {
    print('Error adding pet to Firestore: $e');
  }
}

Future<String?> fetchPetIsDogOrCat(String petType) async {
  try {
    final doc = await FirebaseFirestore.instance
        .collection('petsInformation')
        .doc(petType)
        .get();

    if (doc.exists) {
      return doc.data()?['petIsDogOrCat'] as String?;
    } else {
      return null;
    }
  } catch (e) {
    print('Error fetching petIsDogOrCat: $e');
    return null;
  }
}

// fetch data
// fetch data
Future<List<PetsInformation>> fetchUserPets() async {
  try {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('No user is signed in');
    }

    // Query Firestore collection to fetch pets of the current user
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pets')
        .where('userId', isEqualTo: user.uid)
        .get();

    // Map each document to a PetsInformation object
    List<PetsInformation> petsList = querySnapshot.docs.map((doc) {
      return PetsInformation.fromFirestore(doc);
    }).toList();

    return petsList;
  } catch (e) {
    print('Error fetching pets: $e');
    return [];
  }
}

Future<void> updatePetInFirestore({
  required PetsInformation pet,
  String? imageUrl,
}) async {
  try {
    // Reference to the Firestore collection
    CollectionReference petsCollection =
        FirebaseFirestore.instance.collection('pets');

    // Update the pet document with the provided ID
    await petsCollection.doc(pet.petId).update({
      'petName': pet.petName,
      'petGender': pet.petGender,
      'petType': pet.petType,
      'age': pet.age,
      'petIsDogOrCat': pet.petIsDogOrCat,
      'petWeight': pet.petWeight,
      'skin': pet.skinDiseaseType,
      'poop': pet.poopDiseaseType,
      if (imageUrl != null) 'imageUrl': imageUrl,
      // Any other fields you want to update
    });

    print('Pet updated with ID: ${pet.petId}');
  } catch (e) {
    print('Error updating pet in Firestore: $e');
  }
}

Future<void> deletePetInformations({
  required String petId,
}) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('No user is signed in');
    }

    // Make a copy of the list to iterate over

    QuerySnapshot reminderSnapshot = await FirebaseFirestore.instance
        .collection('reminders')
        .where('pet-id', isEqualTo: petId)
        .get();

    QuerySnapshot feedSnapshot = await FirebaseFirestore.instance
        .collection('feedTimes')
        .where('pet-id', isEqualTo: petId)
        .get();

    await FirebaseFirestore.instance.collection('pets').doc(petId).delete();

    for (QueryDocumentSnapshot doc in reminderSnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('reminders')
          .doc(doc.id)
          .delete();
    }

    for (QueryDocumentSnapshot doc in feedSnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('feedTimes')
          .doc(doc.id)
          .delete();
    }

    print("Deleted feeds successfully");
  } catch (error) {
    print("Error on delete feeds: $error");
    rethrow;
  }
}

class StorageReference {}
