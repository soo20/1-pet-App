//the purpose is provide the configration of size of Ui

import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    // defaultSize is value static to width
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * .024
        : screenWidth! * .024;

    // ignore: avoid_print
    // print('this is the default size $defaultSize');
  }
}

double calculateProportionalWidth(double referenceWidth, double screenWidth) {
  return screenWidth / 1080 * referenceWidth;
}

double calculateProportionalHeight(
    double referenceHeight, double screenHeight) {
  return screenHeight / 1920 * referenceHeight;
}

double calculateProportionalX(double referenceX, double screenWidth) {
  return screenWidth / 1080 * referenceX;
}

double calculateProportionalY(double referenceY, double screenHeight) {
  return screenHeight / 1920 * referenceY;
}

// Example usage:
double referenceWidth = 200.0; // Replace with your reference width
double referenceHeight = 150.0; // Replace with your reference height
double referenceX = 50.0; // Replace with your reference x position
double referenceY = 100.0; // Replace with your reference y position

double screenWidth = 1080.0; // Replace with your actual screen width
double screenHeight = 1920.0; // Replace with your actual screen height

double newWidth = calculateProportionalWidth(referenceWidth, screenWidth);
double newHeight = calculateProportionalHeight(referenceHeight, screenHeight);
double newX = calculateProportionalX(referenceX, screenWidth);
double newY = calculateProportionalY(referenceY, screenHeight);
