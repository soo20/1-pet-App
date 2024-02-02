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
  double _page = 0 ;
  // the index of the left most element of the list to be display
  int get _firstIndex => _page.toInt();
 // controller to the current postion of page view
  final _controller = PageController(
    viewportFraction: 0.5
  ); 
  // width of item
  late final _firstItemWidth = MediaQuery.of(context).size.width*_controller.viewportFraction;
  @override

  void initState(){
    super.initState();
    _controller.addListener(()=>setState(() {
      _page=_controller.page!;
    })); 
  }
  @override
  Widget build(BuildContext context) {
    double aspectRatio = screenHeight / screenWidth;
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
          const SizedBox(width: 12),
        ],
      ),
      extendBodyBehindAppBar: false,
      body:  Stack(
        children: [
           const Positioned(
            top: 0,
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
        const Positioned(
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
           
             Positioned.fill(child: 
             Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: screenWidth,
               // child: FractionallySizedBox(child: HomePageView(index: _firstIndex, url: model[_firstIndex], width: _itemWidth),
              ),
             ))
        ],
      ),
    );
  }
}
