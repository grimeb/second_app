// Widget constructor
import 'package:flutter/material.dart';

class ScheduleSliverAppBar extends StatelessWidget {
  final String _title;
  const ScheduleSliverAppBar(
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
      backgroundColor: Colors.purple[500],
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
          'https://img.icons8.com/nolan/2x/overtime.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}