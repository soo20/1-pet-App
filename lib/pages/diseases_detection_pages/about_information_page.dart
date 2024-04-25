import 'package:flutter/material.dart';

class AboutInformationPage extends StatefulWidget {
  const AboutInformationPage({
    super.key,
    required this.detectionType,
    required this.detectionResult,
  });
  final bool detectionType;
  final String detectionResult;
  @override
  State<AboutInformationPage> createState() => _AboutInformationPageState();
}

class _AboutInformationPageState extends State<AboutInformationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/image/disease_detection_result_page_images/prevention_page_background_image.png',
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
                    top: size.width * 0.2,
                    right: size.width * 0.40,
                  ),
                  child: Text(
                    'DESCRIPTION',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xffC1AFAF),
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.090,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xffC1AFAF),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.02,
                    left: size.width * 0.01,
                  ),
                  child: Text(
                    'What is Bacterial Dermatosis?',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.062,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.14,
                  ),
                  child: Text(
                    'Bacterial Dermatosis is a skin\ninfection caused by bacteria,\nimpacting dogs of all breeds and \nages\. The condition arises when bacteria breach the skin\'s protective barrier, often through wounds, cuts, or underlying skin issues. Maintaining awareness of its causes, symptoms,prevention, and treatment is crucial for ensuring your dog\'s well-being.',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.053,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(137, 74, 94, 124),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.width * 0.08,
                    right: size.width * 0.57,
                  ),
                  child: Text(
                    'CAUSES',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xffC1AFAF),
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.090,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xffC1AFAF),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.02,
                    right: size.width * 0.4,
                  ),
                  child: Text(
                    '1-Skin Breaks:',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.062,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.15,
                  ),
                  child: Text(
                    'Wounds, cuts, or injuries allowing bacteria to enter.',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.053,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(137, 74, 94, 124),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.02,
                    left: size.width * 0.1,
                  ),
                  child: Text(
                    '4-Routine Veterinary Check-ups:',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.062,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.19,
                  ),
                  child: Text(
                    'Proactive measures for early detection and prevention.',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.053,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(137, 74, 94, 124),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.02,
                    right: size.width * 0.02,
                  ),
                  child: Text(
                    '3-Holistic Health Approach:',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.062,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.02,
                  ),
                  child: Text(
                    'Addressing underlying health \nissues comprehensively.',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.053,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(137, 74, 94, 124),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.02,
                    left: size.width * 0.1,
                  ),
                  child: Text(
                    '4-Routine Veterinary Check-ups:',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.062,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.19,
                  ),
                  child: Text(
                    'Proactive measures for early detection and prevention.',
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.053,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(137, 74, 94, 124),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
