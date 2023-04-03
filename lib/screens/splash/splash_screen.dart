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
    Timer(Duration(seconds: 4), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Container(
        color: Colors.brown[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network('https://plus.unsplash.com/premium_photo-1670462145715-c32d0c91e81b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1600&q=80'),
            ),
            SizedBox(
              height: 20,
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
