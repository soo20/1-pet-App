import 'package:flutter/material.dart';
import 'package:petapplication/Welcome/presention/widgets/welcombody.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
    body: WelcomeBody(),
    );
  }
}
