import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/hero_widget.dart';
import 'package:second_app/features/presentation/pages/schedule/schedule_upcoming_detail_page.dart';

import 'package:tuple/tuple.dart';

class ScheduleUpcomingSubPage extends StatelessWidget {
  static const List<Tuple2> tutorials = [
    const Tuple2<String, String>(
      'http://www.newdesignfile.com/postpic/2013/05/group-team-meeting-clip-art_331871.jpg',
      '9:00 AM: Staff meeting 🚀',
    ),
    const Tuple2<String, String>(
      'https://offices.depaul.edu/information-services/services/video-conferencing/PublishingImages/ZoomLogo.png',
      '10:00 AM: Zoom call 😪',
    ),
    const Tuple2<String, String>(
      'https://img.icons8.com/plasticine/2x/approve-and-update.png',
      '11:00 AM: Update teams 👍',
    ),
    const Tuple2<String, String>(
      'https://cdn0.iconfinder.com/data/icons/camping-2-3/66/81-512.png',
      '12:00 PM: Lunch ☘️',
    ),
    const Tuple2<String, String>(
      'https://image.flaticon.com/icons/png/512/1541/1541537.png',
      '1:15 PM: Code review 🤖',
    ),
    const Tuple2<String, String>(
      'https://static.thenounproject.com/png/104097-200.png',
      '3:00 PM: Flex meeting 🦨',
    ),
    const Tuple2<String, String>(
      'https://i.redd.it/qpi1ob3ior331.png',
      'CyberPunk backgrounds #7',
    ),
    const Tuple2<String, String>(
      'https://external-preview.redd.it/U70WzpsaBilnO0ixDP17jYN6tr-2RuHn-qpGKlyntqs.jpg?auto=webp&s=1efdd946bcde188ec18cd7572020a25bb26b4ac7',
      'CyberPunk backgrounds #8',
    ),
    const Tuple2<String, String>(
      'https://i.ytimg.com/vi/gSaosmXT0FU/maxresdefault.jpg',
      'CyberPunk backgrounds #9',
    ),
    const Tuple2<String, String>(
      'https://gamertweak.com/wp-content/uploads/2019/07/cyberpunk-2077-three-staring-characters-1280x720.jpg',
      'CyberPunk backgrounds #10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverContent(),

        // test it out by making a list of a 100 items
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

  SliverFixedExtentList _buildSliverContent() {
    return SliverFixedExtentList(
      itemExtent: 110,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _buildListItem(context, tutorials[index]);
        },
        childCount: tutorials.length,
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Tuple2 tutorial) {
    return Stack(
      children: <Widget>[
        _buildCardView(tutorial.item2, tutorial.item1),
        _buildRippleEffectNavigation(context, tutorial.item2, tutorial.item1)
      ],
    );
  }

  Widget _buildCardView(String desc, String imageUrl) {
    return Positioned.fill(
      child: Card(
        margin: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_buildHeroWidget(imageUrl), _buildDesc(desc)],
        ),
      ),
    );
  }

  Expanded _buildDesc(String desc) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 0),
        child: Text(
          desc,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  HeroWidget _buildHeroWidget(String imageUrl) {
    return HeroWidget(
      width: 150,
      heroTag: imageUrl,
      builder: (BuildContext context) {
        return _buildHeroWidgetContent(imageUrl);
      },
    );
  }

  CachedNetworkImage _buildHeroWidgetContent(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildRippleEffectNavigation(
      BuildContext context, String desc, String imageUrl) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.purple.withOpacity(0.5),
          highlightColor: Colors.purple.withOpacity(0.5),
          onTap: () {
            Navigator.of(context).push(
              _createTutorialDetailRoute(desc, imageUrl),
            );
          },
        ),
      ),
    );
  }

  PageRoute<Object> _createTutorialDetailRoute(desc, imageUrl) {
    return PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: (Tween(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: Curves.ease))
                .animate(animation)),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            ScheduleUpcomingDetailPage(
                heroTag: imageUrl, desc: desc, imageUrl: imageUrl));
  }
}
