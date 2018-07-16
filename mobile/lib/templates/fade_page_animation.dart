
import 'package:flutter/material.dart';

class FadePageAnimation<T> extends MaterialPageRoute<T> {

  FadePageAnimation({
    @required builder,
  }) : super(builder: builder);
  
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) 
      return child;

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}