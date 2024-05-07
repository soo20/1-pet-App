// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final int height;
  final bool expand;

  const ExpandedSection(
      {super.key,
      this.expand = false,
      required this.child,
      required this.height});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: Flexible(
          child: Container(
            padding: EdgeInsets.only(
              bottom: 0,
              top: size.height * 0.05,
            ),
            constraints: BoxConstraints(
                //minHeight: 100,
                minWidth: double.infinity,
                maxHeight: widget.height > 5
                    ? 1050.h
                    : widget.height == 1
                        ? 55
                        : widget.height * 50.0),
            child: Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.01),
                child: widget.child),
          ),
        ));
  }
}
