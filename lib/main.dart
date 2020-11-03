import 'package:flutter/material.dart';
import 'features/presentation/pages/shop/shop_page.dart';

// Practice App made from watching tutorials from Himdeve development's YouTube channel.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShopPage(),
    );
  }
}
