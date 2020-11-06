import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/navigation_controls.dart';
import 'package:second_app/features/presentation/components/shop_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Web Viewer Page

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  // Create state method
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final globalKey = GlobalKey<ScaffoldState>();
  String _title = 'Dashboard AKA the "Cashboard"';

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          NavigationControls(_controller.future),
        ],
      ),
      drawer: ShopDrawer(),
      body: Center(child: Text('Commerce App')),
    );
  }
}
