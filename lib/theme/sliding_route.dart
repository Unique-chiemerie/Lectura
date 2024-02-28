import 'package:flutter/material.dart';

class SlidingRoute extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;

  SlidingRoute({required this.page, this.direction = AxisDirection.right})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: const Duration(seconds: 2),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: Curves.easeIn),
            );
            var offsetanimation = animation.drive(tween);
            return SlideTransition(
              position: offsetanimation,
              child: child,
            );
          },
        );
}
