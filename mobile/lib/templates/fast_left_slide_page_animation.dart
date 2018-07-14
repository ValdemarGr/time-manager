
import 'package:flutter/material.dart';

class FastLeftSlidePageAnimation<T> extends MaterialPageRoute<T> {

  FastLeftSlidePageAnimation({
    @required builder,
  }) : super(builder: builder);
  
  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) 
      return child;

    if (animation.status == AnimationStatus.reverse) {
      return new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child
      );
    } else {
      return new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child
      );
    }
  }
}