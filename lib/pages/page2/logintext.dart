import 'package:flutter/material.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';
//import 'package:petapplication/core/utils/widgets/constants.dart';
//import 'package:petapplication/pages/page2/login_info.dart';
import 'package:petapplication/pages/page2/loginbody.dart';
//import 'package:petapplication/pages/page2/loginbody.dart';

class LoginText extends StatelessWidget {

  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kMainColorSplash,
      body: LoginBody(),
      
    );
  }
}