import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

typedef HeroBuilder = Widget Function(BuildContext context);

class HeroWidget extends StatelessWidget {
  final HeroBuilder heroBuilder;
  final Object heroTag;
  final double width;
  final VoidCallback onTap;
  const HeroWidget({
    Key key,
    @required HeroBuilder builder,
    @required this.heroTag,
    this.width = 100,
    this.onTap,
  })  : heroBuilder = builder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // timeDilation = 7.0;
    return SizedBox(
      width: width,
      child: Hero(
        tag: heroTag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: heroBuilder(context),
            onTap: onTap,
          ),
        ),
        flightShuttleBuilder:
            (flightContext, animation, direction, fromContext, toContext) {
          Widget flyingWidget = toContext.widget as Hero..child;

          if (direction == HeroFlightDirection.push) {
            flyingWidget = fromContext.widget as Hero..child;
          }

          return RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: Curves.ease))
                .animate(animation),
            child: flyingWidget,
          );
          // if (direction == HeroFlightDirection.push) {
          //   return Icon(Icons.photo, size: 150);
          // } else if (direction == HeroFlightDirection.pop) {
          //   return Icon(Icons.access_time, size: 150);
          // }
        },
      ),
    );
  }
}
