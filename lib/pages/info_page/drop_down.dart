// ignore_for_file: unused_field, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:petapplication/pages/info_page/widget_drops.dart';
// Import MyScrollbar if defined elsewhere

class DropDown extends StatefulWidget {
  final String petType;
  final String? petIsDogOrCat;
  const DropDown({super.key, required this.petType, this.petIsDogOrCat});

  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<DropDown> {
  bool screenDropDown = false;
  late final Future<Map<String, dynamic>> petInformationss;
  late final Future<Map<String, dynamic>>? petIsDogOrCatInformation;

  @override
  void initState() {
    super.initState();
    petInformationss = fetchPetInformation(widget.petType);

    // Conditionally fetch petIsDogOrCat information if not null
    if (widget.petIsDogOrCat != null) {
      petIsDogOrCatInformation = fetchPetInformation(widget.petIsDogOrCat!);
    } else {
      petIsDogOrCatInformation = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Map<String, dynamic>>(
      future: petInformationss,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data['imgUrl']),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.085,
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.petType,
                        style: TextStyle(
                          height: size.height * 0.003,
                          fontFamily: 'Cosffira',
                          fontSize: 75.sp,
                          color: const Color(0xff4A5E7C),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15.h),
                      Droper(
                          textContent: 'About', content: data['About'] ?? ''),
                      SizedBox(height: 65.h),
                      Droper(
                          textContent: 'Healthy',
                          content: data['Healthy'] ?? data['Health']),
                      SizedBox(height: 65.h),
                      Droper(
                          textContent: 'Exercises',
                          content: data['Exercises'] ?? data['Exercise']),
                      SizedBox(height: 65.h),
                      Droper(
                          textContent: 'Grooming',
                          content: data['Grooming'] ?? ''),
                      SizedBox(height: 65.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('No data found'));
        }
      },
    );
  }

  Future<Map<String, dynamic>> fetchPetInformation(String petType) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('petsInformation')
          .doc(petType)
          .get();

      if (doc.exists) {
        return doc.data()! as Map<String, dynamic>;
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      print('Error fetching pet information: $e');
      rethrow; // Rethrow the error to handle it in the UI or other layers
    }
  }
}
