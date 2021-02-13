import 'package:flutter/material.dart';

const perspectiveValue = 0.001;

class RotateTransition extends AnimatedWidget {
  final Animation<double> animation;
  final Widget child;

  RotateTransition({
    Key key,
    @required this.animation,
    @required this.child,
  }): super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, perspectiveValue)
            ..rotateY(animation.value),
          child: child,
          );
        },
      child: child,
    );
  }
}
