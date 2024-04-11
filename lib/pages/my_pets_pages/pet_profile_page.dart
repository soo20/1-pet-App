import 'package:flutter/material.dart';

import 'package:petapplication/pages/my_pets_pages/my_pets.dart';

class PetProfilePage extends StatelessWidget {
  const PetProfilePage({super.key, required this.petInformation});
  final PetsInformation petInformation;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/image/pet_profile_page_images/background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: size.height > 707.4285714285714
                    ? size.height * 0.09
                    : size.height * 0.08,
              ),
              ClipOval(
                child: Image.asset(
                  petInformation.imageUrl,
                  width: size.width <= 411.42857142857144
                      ? size.width * 0.79472
                      : size.width * 0.66472,
                  height: size.height > 707.4285714285714
                      ? size.height * 0.35472
                      : size.height * 0.36472,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                petInformation.petName,
                style: TextStyle(
                  fontFamily: 'Cosffira',
                  fontSize: size.width * 0.168,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xffE3B1A8),
                  letterSpacing: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.01),
                child: Text(
                  '${petInformation.petType} | ${petInformation.petGender} | ${petInformation.age}',
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.0548,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromARGB(132, 119, 119, 108),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      const Color(0xff80CBC4),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color?>(
                      const Color(0xffF3F2F2),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle?>(
                      TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.059,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.5,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius here
                      ),
                    ),
                    elevation:
                        MaterialStateProperty.all<double>(size.width * 0.01)),
                onPressed: () {},
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
                      backgroundColor: MaterialStateProperty.all<Color?>(
                        const Color(0xffE3B1A8),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color?>(
                        const Color(0xffF3F2F2),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle?>(
                        TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.059,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust the border radius here
                        ),
                      ),
                      elevation:
                          MaterialStateProperty.all<double>(size.width * 0.01)),
                  onPressed: () {},
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
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      const Color(0xffCCC0C0),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color?>(
                      const Color(0xffF3F2F2),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle?>(
                      TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.059,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.5,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ), // Adjust the border radius here
                      ),
                    ),
                    elevation:
                        MaterialStateProperty.all<double>(size.width * 0.01)),
                onPressed: () {},
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
    );
  }
}
