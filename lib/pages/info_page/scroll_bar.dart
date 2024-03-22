
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';


const double _kScrollbarThickness = 12.0;

class MyScrollbar extends StatefulWidget {
  final ScrollableWidgetBuilder builder;
  final ScrollController scrollController;

  const MyScrollbar({
    super.key,
    required this.scrollController,
    required this.builder,
  });

  @override
  _MyScrollbarState createState() => _MyScrollbarState();
}

class _MyScrollbarState extends State<MyScrollbar> {
  late ScrollbarPainter _scrollbarPainter;
  late ScrollController _scrollController;
 // late Orientation _orientation = Orientation.portrait; // Initialize with a default value
   @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScrollPainter(_scrollController.position);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollbarPainter = _buildMaterialScrollbarPainter();
  }
  @override
  void dispose() {
    _scrollbarPainter.dispose();
    super.dispose();
  }

  ScrollbarPainter _buildMaterialScrollbarPainter() {
    return ScrollbarPainter(
      
      color: Colors.transparent,
      textDirection: Directionality.of(context),
      thickness: _kScrollbarThickness,
      radius: const Radius.circular(20),
      fadeoutOpacityAnimation: const AlwaysStoppedAnimation<double>(1.0),
      padding: const EdgeInsets.only(top:15,right:15,bottom: 5,left: 5),
      
    );
  }
  bool _updateScrollPainter(ScrollMetrics position) {
    _scrollbarPainter.update(
      position,
      position.axisDirection,
    );
    return false;
  }

  @override
  void didUpdateWidget(MyScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateScrollPainter(_scrollController.position);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) =>
              _updateScrollPainter(notification.metrics),
          child: CustomPaint(
            painter: _scrollbarPainter,
            child: widget.builder(context, _scrollController),
          ),
        );
      },
    );
  }
}