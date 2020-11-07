// Widget constructor
import 'package:flutter/material.dart';

class ShopSliverAppBar extends StatelessWidget {
  final String _title;
  const ShopSliverAppBar(
    this._title, {
    Key key,
  }) : super(key: key);

// Widget builder
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.purple[900],
      expandedHeight: 100,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          _title,
          style:
              TextStyle(color: Colors.transparent, fontWeight: FontWeight.bold),
        ),
        background: Image.network(
          'https://img.icons8.com/nolan/2x/mobile-shop-coins.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
