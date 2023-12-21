
import 'package:flutter/material.dart';



class CustomFloatLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Adjust the values below to customize the position
    return Offset(scaffoldGeometry.scaffoldSize.width - 135, scaffoldGeometry.scaffoldSize.height - 131);
  }
}


