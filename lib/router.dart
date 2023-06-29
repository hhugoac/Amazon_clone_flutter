import 'package:ecommerce_clone/common/widgets/bottom_bar.dart';
import 'package:ecommerce_clone/feature/admin/screen/add_product_screen.dart';
import 'package:ecommerce_clone/feature/auth/screen/auth_screen.dart';
import 'package:ecommerce_clone/feature/home/screen/category_deals_screen.dart';
import 'package:ecommerce_clone/feature/home/screen/home_screen.dart';
import 'package:ecommerce_clone/feature/product_detail/screen/product_detail_screen.dart';
import 'package:ecommerce_clone/feature/search/screen/search_screen.dart';
import 'package:ecommerce_clone/model/product.dart';
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
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AddProductScreen());
    case CategoryDealsScreen.routeName:
      var settings = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: settings,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
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
