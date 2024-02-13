import 'package:flutter/material.dart';


class Serface extends StatelessWidget {
  const Serface({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Clip Path Example'),
      ),
      body: Center(
        child: ClipPath(
          clipper: CustomPathClipper(),
          child: Container(
            width: 300, // Adjust the width as needed
            height: 400, // Adjust the height as needed
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
class CustomPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Create a Path object based on the provided SVG path
    Path path = Path();
    path.moveTo(285.8271484375, 166.3972778320312);
    path.cubicTo(
        85.981689453125, 104.1020584106445, 1.4736328125, -201.95654296875, 1.4736328125, -201.95654296875);
    path.lineTo(0, 1574.04345703125);
    path.lineTo(1080, 1574.04345703125);
    path.lineTo(1080, 298.3213500976562);
    path.cubicTo(
        1080, 243.4685974121094, 999.398681640625, 80.20536041259766, 800.85546875, 47.22433471679688);
    path.cubicTo(
        602.312255859375, 14.24331855773926, 485.672607421875, 228.6924743652344, 285.8271484375, 166.3972778320312);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


