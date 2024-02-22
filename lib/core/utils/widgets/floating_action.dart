import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Adjust the values below to customize the position
    return Offset(scaffoldGeometry.scaffoldSize.width - 135.w,
        scaffoldGeometry.scaffoldSize.height - 131.h);
  }
}
