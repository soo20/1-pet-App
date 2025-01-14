import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:petapplication/pages/info_page/expanded_list.dart';
// Import ExpandedSection if defined elsewhere
import 'package:petapplication/pages/info_page/scroll_bar.dart'; // Import MyScrollbar if defined elsewhere

class Droper extends StatefulWidget {
  final String textContent;
  final String content;

  const Droper({super.key, required this.textContent, required this.content});

  @override
  State<Droper> createState() => _DroperState();
}

class _DroperState extends State<Droper> {
  bool screenDropDown = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      screenDropDown = !screenDropDown;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: screenDropDown
                          ? const Color(0xffA26874)
                          : const Color.fromARGB(118, 162, 104, 116),
                      border: Border.all(
                        width: 0.2,
                        color: const Color(0xff707070),
                      ),
                      borderRadius: BorderRadius.circular(80.r),
                    ),
                    constraints: BoxConstraints(
                      minHeight: 200.h,
                      minWidth: double.infinity,
                    ),
                    padding: EdgeInsets.only(left: size.width * 0.08),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.textContent,
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: 60.sp,
                              color: screenDropDown
                                  ? const Color(0xffFFFFFF)
                                  : const Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.07),
                          child: SvgPicture.asset(
                            screenDropDown
                                ? 'assets/icons/dropUp.svg'
                                : 'assets/icons/dropDown.svg', // Path to your SVG file
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ExpandedSection(
                  expand: screenDropDown,
                  height:
                      screenDropDown ? _getExpandedSectionHeight().round() : 0,
                  child: Builder(
                    builder: (context) {
                      return MyScrollbar(
                        builder: (context, scrollController) =>
                            ListView.builder(
                          controller: scrollController,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Text(
                              widget.content,
                              style: TextStyle(
                                fontFamily: 'Cosffira',
                                fontSize: 44.sp,
                                color: const Color(0xff797979),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            );
                          },
                        ),
                        scrollController: _scrollController,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  double _getExpandedSectionHeight() {
    // Implement your logic to calculate the height of the expanded section

    return 100; // Return the calculated height
  }
}
// class Droper extends StatefulWidget {
//   final String textContent;
//   const Droper({super.key, required this.textContent});

//   @override
//   DroperState createState() => DroperState();
// }

// class DroperState extends State<Droper> {
//   bool screenDropDown = false;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               screenDropDown = !screenDropDown;
//             });
//           },
//           child: Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: screenDropDown
//                   ? const Color(0xffA26874)
//                   : const Color.fromARGB(118, 162, 104, 116),
//               border: Border.all(
//                 width: 0.2,
//                 color: const Color(0xff707070),
//               ),
//               borderRadius: BorderRadius.circular(80.r),
//             ),
//             constraints: BoxConstraints(minHeight: 200.h),
//             padding: EdgeInsets.only(left: size.width * 0.08),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     widget.textContent,
//                     style: TextStyle(
//                       fontFamily: 'Cosffira',
//                       fontSize: 60.sp,
//                       color: screenDropDown
//                           ? const Color(0xffFFFFFF)
//                           : const Color(0xffFFFFFF),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(right: size.width * 0.07),
//                   child: SvgPicture.asset(
//                     screenDropDown
//                         ? 'assets/icons/dropUp.svg'
//                         : 'assets/icons/dropDown.svg',
//                     width: 30.w,
//                     height: 30.h,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (screenDropDown)
//           ExpandedSection(
//             expand: screenDropDown,
//             height: screenDropDown ? 100.round() : 0,
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: Text(
//                 'Some content related to ${widget.textContent}',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
