import 'package:flutter/material.dart';


class HomePageView extends StatelessWidget {

  const HomePageView({super.key,});

  @override
  Widget build(BuildContext context) {

    return  Row(
      children: [
        Container(
          height: 110,
          width: 215,
          
          decoration: BoxDecoration(
            color: const Color.fromARGB(75, 128, 203, 195),
            borderRadius: BorderRadius.circular(10),
          ),
        )
      ],
    );
  }
} 