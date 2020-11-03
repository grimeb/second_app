import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/hero_widget.dart';

class ScheduleUpcomingDetailPage extends StatelessWidget {
  final Object heroTag;
  final String desc;
  final String imageUrl;

  const ScheduleUpcomingDetailPage(
      {Key key,
      @required this.heroTag,
      @required this.desc,
      @required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Details'),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeroWidget(context),
          _buildDesc(),
        ],
      ),
    );
  }

  HeroWidget _buildHeroWidget(BuildContext context) {
    return HeroWidget(
      builder: (BuildContext context) {
        return _buildHeroWidgetContent(imageUrl);
      },
      heroTag: heroTag,
      width: MediaQuery.of(context).size.width,
    );
  }

  CachedNetworkImage _buildHeroWidgetContent(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildDesc() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        desc,
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }
}
