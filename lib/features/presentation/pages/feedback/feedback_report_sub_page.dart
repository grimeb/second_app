// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:second_app/features/presentation/components/hero_widget.dart';
// import 'package:second_app/features/presentation/pages/cart/cart_detail_page.dart';
// import 'package:tuple/tuple.dart';

class FeedbackReportSubPage extends StatelessWidget {
  final TextStyle counterStyle;
  final String counterText;
  const FeedbackReportSubPage({Key key, this.counterStyle, this.counterText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[500],
      height: 400,
      width: 700,
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                counterStyle: counterStyle,
                counterText: counterText,
                labelText: 'What seems to be the problem?'),
          ),
          Positioned(
            bottom: 0,
            left: 175,
            child: RaisedButton(
              color: Colors.purple[500],
              onPressed: () {},
              child: Text('Report'),
            ),
          )
        ],
      ),
    );
  }
}
