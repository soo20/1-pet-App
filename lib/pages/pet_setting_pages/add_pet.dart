// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/my_pets_pages/my_pets.dart';

class AddPets extends StatefulWidget {
  const AddPets({super.key});

  @override
  State<AddPets> createState() => _AddPetsState();
}

class _AddPetsState extends State<AddPets> {
  final _gender = ["Male", "Female"];
  String?
      _Selected; // Make _Selected nullable againRemove the nullable operator
  //var _currentItemSelected =
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEFEF),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 280.h,
                      width: 270.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/image/Group998.png',
                            ),
                            fit: BoxFit.fill),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70, left: 70),
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 0.5,
                              color: Colors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.13),
                                offset: const Offset(0, 10),
                              )
                            ],
                            color: const Color(0xff80CBC4),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: Color.fromARGB(190, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      'MAIN INFORMATION',
                      style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: 85.sp,
                        color: const Color(0xff80cbc4),
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: const Color(0xa1000000),
                            offset: const Offset(0, 1.5),
                            blurRadius: 6.r,
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                    //1
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 10),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 50.sp,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            // labelText: 'Pet Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Pet Name',
                            hintStyle: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 45.sp,
                              color: const Color.fromARGB(126, 0, 0, 0),
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD1D2D2),
                                width: 0.8, // Set the width of the border here
                              ),
                            )),
                      ),
                    ),
                    //2
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 50.sp,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            // labelText: 'Pet Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Pet Type',
                            hintStyle: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 45.sp,
                              color: const Color.fromARGB(126, 0, 0, 0),
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD1D2D2),
                                width: 0.8, // Set the width of the border here
                              ),
                            )),
                      ),
                    ),
                    //3

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 50.sp,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          // labelText: 'Pet Name',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Age',
                          hintStyle: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 50.sp,
                            color: const Color.fromARGB(126, 0, 0, 0),
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffD1D2D2),
                              width: .8, // Set the width of the border here
                            ),
                          ),
                        ),
                      ),
                    ),
                    // 4

                    /* DropdownButton(
                      value: _Selected,
                         items: _gender.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(),
                           onChanged: (val) {
    // Handle the onChanged event here
                             setState(() {
                              _Selected = val.toString(); // Update the selected value
                             });
                                 },
                            ),*/
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: DropdownButtonFormField(
                        dropdownColor: const Color(0xffB8D8D4),
                        iconEnabledColor: const Color(0xffB8D8D4),
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 50.sp,
                          color: const Color(0xffF5F5F5),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Gender',
                          hintStyle: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: 50.sp,
                            color: const Color.fromARGB(126, 0, 0, 0),
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffD1D2D2),
                              width: .8, // Set the width of the border here
                            ),
                          ),
                        ),
                        value: _Selected,
                        items: _gender
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) {
                          // Handle the onChanged event here
                          setState(() {
                            _Selected =
                                val.toString(); // Update the selected value
                          });
                        },
                        selectedItemBuilder: (BuildContext context) {
                          return _gender.map<Widget>((String item) {
                            return Text(
                              item,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 162, 192, 189)),
                            );
                          }).toList();
                        },
                      ),
                    ),

                    // 5
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 50.sp,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                      //  to take only number
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          
                        ],
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            // labelText: 'Pet Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Weight',
                            suffixText: 'In Kg',
                            suffixStyle: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 50.sp,
                              color: const Color.fromARGB(126, 0, 0, 0),
                              fontWeight: FontWeight.w400,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 50.sp,
                              color: const Color.fromARGB(126, 0, 0, 0),
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD1D2D2),
                                width: 0.8, // Set the width of the border here
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    CustomGeneralButtom(
                      boxColor: const Color(0xff2A606C),
                      textColor: const Color(0xffFFFFFF),
                      height: 135.h,
                      width: 385.w,
                      borderColor: const Color.fromARGB(108, 112, 112, 112),
                      text: 'Finish',
                      onTap: () {
                        Get.to(
                            () => PetsInformation(
                                  imageUrl: '',
                                  petName: '',
                                  petGender: '',
                                  petId: '',
                                  petType: '',
                                  age: '',
                                ),
                            transition: Transition.zoom);
                      },
                      fontWeight: FontWeight.w500,
                      customFontSize: 50.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
