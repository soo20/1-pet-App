import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TreatmentInformationPage extends StatefulWidget {
  const TreatmentInformationPage({
    super.key,
    required this.detectionType,
    required this.detectionResult,
  });
  final bool detectionType;
  final String detectionResult;
  @override
  State<TreatmentInformationPage> createState() =>
      _TreatmentInformationPageState();
}

class _TreatmentInformationPageState extends State<TreatmentInformationPage> {
  late final Future<Map<String, dynamic>> petInformationsDiseasesTreatment;

  @override
  void initState() {
    super.initState();
    petInformationsDiseasesTreatment =
        fetchPetInformation(widget.detectionResult);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Map<String, dynamic>>(
      future: petInformationsDiseasesTreatment,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          final orderedFields = data.keys.toList()..sort();
          return SafeArea(
            child: Scaffold(
              body: Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/image/disease_detection_result_page_images/treatment_skin_background_image.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.width * 0.1,
                          right: size.width * 0.40,
                        ),
                        child: Text(
                          'TREATMENT',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xff9CABC0),
                            fontFamily: 'Cosffira',
                            fontSize: size.width * 0.090,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xff9CABC0),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.width * 0.03,
                            left: size.width * 0.05,
                            bottom: size.width * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: orderedFields.map((field) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 9.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '$field:\n ',
                                      style: TextStyle(
                                        fontFamily: 'Cosffira',
                                        fontSize: size.width * 0.055,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        height: size.width * 0.0027,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${data[field]}',
                                      style: TextStyle(
                                        fontFamily: 'Cosffira',
                                        fontSize: size.width * 0.050,
                                        fontWeight: FontWeight.normal,
                                        color: const Color.fromARGB(
                                            137, 74, 94, 124),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(child: Text('No data found'));
        }
      },
    );
  }

  Future<Map<String, dynamic>> fetchPetInformation(
      String detectionResult) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection(detectionResult)
          .doc('treatment')
          .get();

      if (doc.exists) {
        return doc.data()!;
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      print('Error fetching pet information: $e');
      rethrow; // Rethrow the error to handle it in the UI or other layers
    }
  }
}