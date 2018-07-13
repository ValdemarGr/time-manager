
import 'package:flutter/material.dart';

class FastLeftSlidePageAnimation<T> extends MaterialPageRoute<T> {

  FastLeftSlidePageAnimation({
    @required builder,
  }) : super(builder: builder);
  
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    if (animation.status == AnimationStatus.reverse)
      return FadeTransition(opacity: secondaryAnimation, child: child);
      //return super.buildTransitions(context, animation, secondaryAnimation, child);
    //return FadeTransition(opacity: animation, child: child);

    return SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(-1.0, 0.0), //Starts from out of the screen
        end: Offset.zero
      ).animate(
        new CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn //fase curve
        )
      ),
      child: child,
    );

    //if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    //if (animation.status == AnimationStatus.reverse)
      //return FadeTransition(opacity: secondaryAnimation, child: child);
    //return FadeTransition(opacity: animation, child: child);
  }
}