import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/navigation_controls.dart';
import 'package:second_app/features/presentation/components/shop_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Web Viewer Page

class ShopPage extends StatefulWidget {
  ShopPage({Key key}) : super(key: key);

  // Create state method
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final globalKey = GlobalKey<ScaffoldState>();
  String _title = 'About Me Page';

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
      body: _buildWebView(),
      floatingActionButton: _buildShowUrlBtn(),
    );
  }

  Widget _buildWebView() {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl:
          'https://www.securitymagazine.com/articles/93856-capcom-suffers-security-breach',
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      navigationDelegate: (request) {
        return _buildNavigationDecision(request);
      },
      javascriptChannels: <JavascriptChannel>[
        _createTopBarJsChannel(),
      ].toSet(),
      onPageFinished: (url) {
        _showPageTitle();
      },
    );
  }

  // Widget _buildChangeTitleBtn() {
  //   return FloatingActionButton(
  //     onPressed: () {
  //       setState(() {
  //         _title = 'Learn more.';
  //       });
  //     },
  //     child: Icon(Icons.title),
  //   );
  // }

  // Code for future builder
  Widget _buildShowUrlBtn() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              String url = await controller.data.currentUrl();

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Current url is: $url',
                  style: TextStyle(fontSize: 20),
                ),
              ));
            },
            child: Icon(Icons.link),
          );
        }

        return Container();
      },
    );
  }

  NavigationDecision _buildNavigationDecision(NavigationRequest request) {
    if (request.url.contains('/work')) {
      globalKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'You do not have permission to WORK page',
          style: TextStyle(fontSize: 20),
        ),
      ));
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }

  void _showPageTitle() {
    _controller.future.then((webViewController) {
      webViewController
          .evaluateJavascript('TopBarJsChannel.postMessage(document.title);');
    });
  }

  JavascriptChannel _createTopBarJsChannel() {
    return JavascriptChannel(
        name: 'TopBarJsChannel',
        onMessageReceived: (message) {
          String newTitle = message.message;

          if (newTitle.contains('-')) {
            newTitle = newTitle.substring(0, newTitle.indexOf('-')).trim();
          }
          setState(() {
            _title = newTitle;
          });
        });
  }
}
