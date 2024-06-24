// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petapplication/pages/info_page/widget_drops.dart';

class DropDown extends StatefulWidget {
  final String petType;
  final String? petIsDogOrCat;

  const DropDown({super.key, required this.petType, this.petIsDogOrCat});

  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<DropDown> {
  late final Future<Map<String, dynamic>> petInformationss;

  @override
  void initState() {
    super.initState();
    petInformationss =
        fetchPetInformation(widget.petType, widget.petIsDogOrCat);
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
          if (data.containsKey('alert')) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: const Color(0xffEFE6E5),
                    title: const Text('Alert'),
                    content: Text(
                        'This type of ${widget.petIsDogOrCat} is not present in our dataset, but we will provide you with general information about ${widget.petIsDogOrCat} so that you can benefit.'),
                    titleTextStyle: TextStyle(
                      height: size.height * 0.003,
                      fontFamily: 'Cosffira',
                      fontSize: 75.sp,
                      color: const Color(0xffA26874),
                      fontWeight: FontWeight.w600,
                    ),
                    contentTextStyle: TextStyle(
                      height: size.height * 0.002,
                      fontFamily: 'Cosffira',
                      fontSize: 45.sp,
                      color: const Color(0xff4A5E7C),
                      fontWeight: FontWeight.w400,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(
                            height: size.height * 0.003,
                            fontFamily: 'Cosffira',
                            fontSize: 55.sp,
                            color: const Color(0xffA26874),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            });
          }
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

  Future<Map<String, dynamic>> fetchPetInformation(
      String petType, String? petIsDogOrCat) async {
    try {
      // First, attempt to fetch by petType
      final doc = await FirebaseFirestore.instance
          .collection('petsInformation')
          .doc(petType)
          .get();

      if (doc.exists) {
        return doc.data()! as Map<String, dynamic>;
      } else {
        // If petType document does not exist, fetch by petIsDogOrCat if provided
        if (petIsDogOrCat != null) {
          final alternativeDoc = await FirebaseFirestore.instance
              .collection('petsInformation')
              .doc(petIsDogOrCat)
              .get();

          if (alternativeDoc.exists) {
            final data = alternativeDoc.data()! as Map<String, dynamic>;
            data['alert'] = true; // Add alert key to indicate fallback
            return data;
          } else {
            throw Exception('Neither document exists');
          }
        } else {
          throw Exception('Document does not exist');
        }
      }
    } catch (e) {
      print('Error fetching pet information: $e');
      rethrow; // Rethrow the error to handle it in the UI or other layers
    }
  }
}
