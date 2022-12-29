import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_test_app/model/code_item_model.dart';

import '../config/const.dart';
import 'item_widget.dart';

class SlideFadeTransition extends StatefulWidget {
  final Widget child;
  final double offset;
  final Curve curve;
  final Direction direction;
  final Duration delayStart;
  final Duration animationDuration;

  const SlideFadeTransition({
    super.key,
    required this.child,
    this.offset = 1.0,
    this.curve = Curves.easeIn,
    this.direction = Direction.vertical,
    this.delayStart = const Duration(seconds: 0),
    this.animationDuration = const Duration(milliseconds: 800),
  });

  @override
  _SlideFadeTransitionState createState() => _SlideFadeTransitionState();
}

enum Direction { vertical, horizontal }

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animationSlide;

  late AnimationController _animationController;

  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    if (widget.direction == Direction.vertical) {
      _animationSlide = Tween<Offset>(
              begin: Offset(0, widget.offset), end: const Offset(0, 0))
          .animate(CurvedAnimation(
        curve: widget.curve,
        parent: _animationController,
      ));
    } else {
      _animationSlide = Tween<Offset>(
              begin: Offset(widget.offset, 0), end: const Offset(0, 0))
          .animate(CurvedAnimation(
        curve: widget.curve,
        parent: _animationController,
      ));
    }

    _animationFade =
        Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
      curve: widget.curve,
      parent: _animationController,
    ));

    Timer(widget.delayStart, () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationFade,
      child: SlideTransition(
        position: _animationSlide,
        child: widget.child,
      ),
    );
  }
}

SlideFadeTransition animatedText(
    double size, String text, color, time, int line) {
  return SlideFadeTransition(
    animationDuration: Duration(milliseconds: time),
    child: Text(
      maxLines: line,
      textScaleFactor: 1.0,
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(color: color, fontSize: size, letterSpacing: .6),
      ),
    ),
  );
}

Expanded animationListViewCode(
    List<CodeItemModel> listCodeItem, double height) {
  return Expanded(
    child: AnimationLimiter(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: listCodeItem.length,
        itemBuilder: (context, index) {
          int indexAnimation = index + 1;
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 400),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 1550),
              horizontalOffset: height / 4,
              curve: Curves.ease,
              child: FadeInAnimation(
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 1550),
                child: FadeInAnimation(
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 1600),
                  child: itemCode(
                    codeItemModel: listCodeItem[index],
                    indexAnimation: indexAnimation,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

Container animationListViewCategory(double height) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: height / 44),
    height: height / 10,
    child: AnimationLimiter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: listCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          int indexAnimation = index + 1;
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 400),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 1500),
              horizontalOffset: 250,
              curve: Curves.decelerate,
              child: FadeInAnimation(
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 1500),
                child: itemCategory(
                  listCategory: listCategory,
                  indexAnimation: indexAnimation,
                  index: index,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
