import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageView extends StatelessWidget {
  final int index ;
  final String url ;
  final double width ;
  const HomePageView({super.key, required this.index, required this.url, required this.width});

  @override
  Widget build(BuildContext context) {

    return  Card(
      elevation: 5,
      child: SvgPicture.asset('assets/icons/pngtree-dog-yellow-glasses-silence-calm-cartoon-png-image_6661438.svg') ,
      
    );
  }
}