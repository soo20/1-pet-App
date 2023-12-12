// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petapplication/core/utils/widgets/constants.dart';

class Component1311 extends StatelessWidget {
  const Component1311({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33.0),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
            margin: const EdgeInsets.fromLTRB(20.0, 115.0, 135.0, 490.2),
          ),
        ),
        Positioned(
          right: 184.7,
          bottom: 400.0,
          width: 80,
          height: 110,
          child: SvgPicture.string(
            _svg_pp2ta,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fitWidth,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 144.0, 115.0, 00.0),
          child: SizedBox.expand(
              child: Text(
            'I don\'t mind whether or not you\nknow me. Many people do\nknow me, but I\'m sparky, There\nis a community for pet lovers\nto connect with each other,\nadopt pets, and find\ncompanions for them. Are you\nfamiliar with it? I\'m a well-\nknown monkey in that\ncommunity',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              color: Color(0xff000000),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          )),
        ),
      ],
    );
  }
}

class Component1312 extends StatelessWidget {
  const Component1312({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = 1080;
    double screenHeight = 1920;

    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate dimensions based on a 16:9 aspect ratio
    double containerWidth = screenWidth - 324; // Adjust this value as needed
    double containerHeight = containerWidth / 16 * 9;

    return AspectRatio(aspectRatio: aspectRatio ,
    child : Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(width: 0.6, color: const Color(0xff707070)),
            ),
            margin: const EdgeInsets.fromLTRB(170.0, 105.0, 0.0, 445.2),
            width: containerWidth,
            height: containerHeight,
          ),
        ),
        Positioned(
          right: 120.7,
          bottom: 387.0,
          width: 72,
          height: 60,
          child: SvgPicture.string(
            '<svg viewBox="76.2 386.5 158.9 140.5" ><path transform="translate(-1877.52, 4023.51)" d="M 2112.6181640625 -3637 L 2060.0625 -3545.62158203125 L 1953.72900390625 -3496.4853515625 L 1953.72900390625 -3496.4853515625 L 2016.062255859375 -3545.62158203125 L 2003.840087890625 -3637 L 2112.6181640625 -3637 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.cover,
          ),
        ),
       const Padding(
          padding:  EdgeInsets.fromLTRB(170.0, 120.0, 00.0, 00.0),
          child: SizedBox.expand(
            child: Text(
              'Hello, I am Tesla. Many pet\nowners want to train their\npets and acquire the\nnecessary information\nabout them, and I am here\nto assist with that',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15.1,
                color: Color(0xff000000),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
    );
  }
}



class Component1313 extends StatelessWidget {
  const Component1313({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: kMainColorPage,
              borderRadius: BorderRadius.circular(29.0),
              border: Border.all(width: 0.6, color: const Color(0xff707070)),
            ),
            margin: const EdgeInsets.fromLTRB(29.0, 133.0, 185.0, 592.2),
          ),
        ),
        Positioned(
          right: 200.7,
          top: 269.0,
          width: 75,
          height: 75,
          child: SvgPicture.string(
            _svg_pp2ta,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.contain,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(00.0, 144.0, 155.0, 00.0),
          child: SizedBox.expand(
              child: Text(
            overflow: TextOverflow.ellipsis,
            'Let\'s start by defining\nyour lovely pet. You can \nchoose to define it with\nJack, or you can\nmanually add your pet\'s\ndetails.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14.4,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          )),
        ),
      ],
    );
  }
}

// ignore: constant_identifier_names
const String _svg_pp2ta =
    '<svg viewBox="299.2 364.0 181.2 160.2" ><path transform="translate(-1654.57, 4001.0)" d="M 1953.72900390625 -3637 L 2013.6484375 -3532.818359375 L 2134.880859375 -3476.79736328125 L 2134.880859375 -3476.79736328125 L 2063.813720703125 -3532.818359375 L 2077.748291015625 -3637 L 1953.72900390625 -3637 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
