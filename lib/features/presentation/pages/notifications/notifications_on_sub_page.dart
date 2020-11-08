import 'package:flutter/material.dart';
// import 'package:tuple/tuple.dart';

class NotificationsOnSubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // SliverList(
        //     delegate: SliverChildListDelegate(
        //   [
        //     for (var i = 1; i < 101; i++)
        //       ListTile(
        //         title: Text(i.toString()),
        //       ),
        //   ],
        // ))
      ],
    );
  }
}
