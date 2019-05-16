import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    String direction,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child
  ) {
    if (settings.isInitialRoute)
      return child;
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0,0.0),
        end: Offset.zero
      ).animate(animation),
      child: child,
    );
  }
}