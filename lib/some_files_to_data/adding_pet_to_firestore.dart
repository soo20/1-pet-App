import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petapplication/pages/events_system/events_for_pet.dart';
import 'package:petapplication/pages/sign_login_acount/loginbody.dart';

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
  });

  late String imageUrl;
  late String petName;
  late String petGender;
  late String petId;
  late String petType;
  late String? age;
  late String? petIsDogOrCat;
  bool selected = false;
  String skinDiseaseType = '';
  String poopDiseaseType = '';
  List<CustomTime> feedTimesForPet = [];
  List<ReminderData> remindersData = [];
  double? petWeight;
}

Future addPetInFireStore({required PetsInformation pet}) async {
  DocumentReference docRef =
      await FirebaseFirestore.instance.collection('pets').add(
    {
      'image-url': pet.imageUrl,
      'pet-is-dog-or-cat': pet.petIsDogOrCat,
      'pet-name': pet.petName,
      'pet-gender': pet.petGender,
      'pet-type': pet.petType,
      'pet-skin-disease-type': pet.skinDiseaseType,
      'pet-poop-disease-type': pet.poopDiseaseType,
      'age': pet.age,
      'pet-weight': pet.petWeight,
      'user-id': userId,
    },
  );
  String petId = docRef.id;
  await FirebaseFirestore.instance.collection('pets').doc(petId).update(
    {'pet-id': petId},
  );
}
