// import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';
// import 'package:second_app/features/presentation/pages/shop/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/shop_drawer.dart';
// import 'package:second_app/features/presentation/components/navigation_controls.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            '🔥🔥🔥 Main Page 🔥🔥🔥',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: ShopDrawer(),
        body: Center(
          child: Container(
            width: 400,
            height: 700,
            color: Colors.purple[500],
            child: Stack(
              // fit: StackFit.loose,
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  width: 400,
                  child: Container(
                    height: 300,
                    // width: 500,
                    decoration: BoxDecoration(
                      color: Colors.purple[500],
                      image: DecorationImage(
                        image: AssetImage("assets/images/hypeweek.gif"),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://cdn.searchenginejournal.com/wp-content/uploads/2019/05/facebookvideoranking.png"),
                    ),
                  ),
                ),
              ],
              overflow: Overflow.visible,
            ),
          ),
        ));
  }
}
