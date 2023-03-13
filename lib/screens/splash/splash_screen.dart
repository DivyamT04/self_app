import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/images/logo-symbol.png'),
                width: 400,
                height: 400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Shopify',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.brown,
                    fontStyle: FontStyle.italic,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
