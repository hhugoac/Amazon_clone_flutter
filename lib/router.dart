import 'package:ecommerce_clone/common/widgets/bottom_bar.dart';
import 'package:ecommerce_clone/feature/auth/screen/auth_screen.dart';
import 'package:ecommerce_clone/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => BottomBar());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Error screen doesn\'t exists'),
          ),
        ),
      );
  }
}
