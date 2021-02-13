import 'dart:math';
import 'package:flutter/material.dart';
import 'package:english_buddy/widgets/rotate_transition.dart';

const angel = pi / 2;
const defaultDuration = 500;
const weight = 50.0;

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;
  final int duration;
  
  FlipCard({
    Key key,
    @required this.front,
    @required this.back,
    this.duration = defaultDuration,
  }): super(key: key);

  @override
  FlipCardState createState() => FlipCardState();
}

class FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _frontAnimation;
  Animation<double> _backAnimation;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    _frontAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: -angel).chain(CurveTween(curve: Curves.easeIn)),
          weight: weight,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(angel),
          weight: weight,
        ),
      ],
    ).animate(_controller);
    _backAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(angel),
          weight: weight,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: angel, end: 0.0).chain(CurveTween(curve: Curves.easeOut)),
          weight: weight,
        ),
      ],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void flipCard() {
    if (isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    setState(() {
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        _buildWidget(front: true),
        _buildWidget(front: false),
      ],
    );
  }

  Widget _buildWidget({ @required bool front }) {
    return IgnorePointer(
      ignoring: front ? !isFront : isFront,
      child: RotateTransition(
        animation: front ? _frontAnimation : _backAnimation,
        child: front ? widget.front : widget.back,
      ),
    );
  }
}
