import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatelessWidget {
  final Future<WebViewController> _controllerFuture;
  const NavigationControls(this._controllerFuture, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _controllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return Row(
            children: <Widget>[
              _buildBackHistoryBtn(controller, context),
              _buildRefreshBtn(controller),
              _buildForwardHistoryBtn(controller, context)
            ],
          );
        }

        return Container();
      },
    );
  }

  FlatButton _buildForwardHistoryBtn(
      AsyncSnapshot<WebViewController> controller, BuildContext context) {
    return FlatButton(
      textColor: Colors.white,
      child: Row(
        children: <Widget>[
          Icon(Icons.arrow_right),
          Text('next'),
        ],
      ),
      onPressed: () async {
        if (await controller.data.canGoForward()) {
          controller.data.goForward();
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'No forward history',
              style: TextStyle(fontSize: 20),
            ),
          ));
        }
      },
    );
  }

  FlatButton _buildBackHistoryBtn(
      AsyncSnapshot<WebViewController> controller, BuildContext context) {
    return FlatButton(
      textColor: Colors.white,
      child: Row(
        children: <Widget>[
          Text('back'),
          Icon(Icons.arrow_right),
        ],
      ),
      onPressed: () async {
        if (await controller.data.canGoBack()) {
          controller.data.goBack();
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'No back history',
              style: TextStyle(fontSize: 20),
            ),
          ));
        }
      },
    );
  }

  IconButton _buildRefreshBtn(AsyncSnapshot<WebViewController> controller) {
    return IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          controller.data.reload();
        });
  }
}
