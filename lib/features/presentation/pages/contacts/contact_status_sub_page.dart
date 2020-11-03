import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/hero_widget.dart';
import 'package:second_app/features/presentation/pages/contacts/contact_status_detail_page.dart';
import 'package:tuple/tuple.dart';

class ContactStatusSubPage extends StatelessWidget {
  static const List<Tuple2> tutorials = [
    const Tuple2<String, String>(
      'https://elements-video-cover-images-0.imgix.net/files/17c74a26-2112-4bae-87d4-53f37e578115/inline_image_preview.jpg?auto=compress%2Cformat&fit=min&h=394&w=700&s=148d1a26ccf7cc72e94bbecbe01dd6b5',
      'CyberPunk backgrounds #1 🚀',
    ),
    const Tuple2<String, String>(
      'https://i.imgur.com/XXI3y4g.jpg',
      'CyberPunk backgrounds #2 😪',
    ),
    const Tuple2<String, String>(
      'https://images.wallpapersden.com/image/download/background-of-cyberpunk-game_71766_3840x2160.jpg',
      'CyberPunk backgrounds #3 👍',
    ),
    const Tuple2<String, String>(
      'https://thumbs.gfycat.com/BareFlashyAsiaticmouflon-size_restricted.gif',
      'CyberPunk backgrounds #4 ☘️',
    ),
    const Tuple2<String, String>(
      'https://wallpaperaccess.com/full/676037.jpg',
      'CyberPunk backgrounds #5 👻',
    ),
    const Tuple2<String, String>(
      'https://cdn.hipwallpaper.com/i/78/45/ZLg91k.jpg',
      'CyberPunk backgrounds #6 🦨',
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
            ContactStatusDetailPage(
                heroTag: imageUrl, desc: desc, imageUrl: imageUrl));
  }
}
