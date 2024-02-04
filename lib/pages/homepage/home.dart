import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/pages/homepage/homepageview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override

  
  @override
  Widget build(BuildContext context) {
    //double aspectRatio = screenHeight / screenWidth;
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      drawer: const Drawer(

          //backgroundColor:const Color(0xff2A606C) ,
          ),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        foregroundColor: const Color(0xff2A606C),
        toolbarHeight: 60,
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/Group1278.svg',
              width: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/Group1279.svg',
              width: 27,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/image/MaskGroup8.png',
              width: 36,
            ),
          ),
          const SizedBox(width: 13),
        ],
      ),
      extendBodyBehindAppBar: false,
      body:  Stack(
        children: [
          const  Positioned(
            top: 10,
            left: 20,
            child: Text(
              'Future Events',
              style: TextStyle(
                fontFamily: 'SugarFont',
                fontSize: 29,
                color: Color(0xff2a606c),
                fontWeight: FontWeight.w900,
                shadows: [
                  Shadow(
                    color: Color(0xa1000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
              softWrap: false,
            ),
          ),
       const  Positioned(
              right: 30,
              top: 20,
              child: Text(
                'view All',
                style: TextStyle(
                  fontFamily: 'SugarFont',
                  fontSize: 16,
                  color: Color(0xff80cbc4),
                  height: 2.3,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              )),
           
             Positioned.fill(
              bottom: screenHeight/4.7,
              left: 15,
              child: HomePageView())
        ],
      ),
    );
  }
}
