import 'package:flutter/material.dart';
import 'package:petapplication/Welcome/character.dart';


class CustomWelcomPage extends StatelessWidget {
  const CustomWelcomPage({super.key, @required this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}

//in this variable we put the argument value when calling widget
class WelcomPageView extends StatelessWidget {
  const WelcomPageView({
    super.key,
    @required this.pageController,
  });
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        Yyuna(),
        Jjack(),
        Ggizmo(),
        //TextOverImageItem4(),
        Wwanda(),
        // TextOverSVGImage6(),
      ],
    );
  }
}
