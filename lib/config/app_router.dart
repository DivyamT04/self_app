import 'package:flutter/material.dart';
import 'package:self_app/screens/cart/cart_screen.dart';
import 'package:self_app/screens/wishlist/wishlist_screen.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../screens/catalog/catalog_screen.dart';
import '../screens/home/home.dart';
import '../screens/product/product_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case '/':
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishListScreen.routeName:
        return WishListScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Categorym);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text('Error')),
        ));
  }
}