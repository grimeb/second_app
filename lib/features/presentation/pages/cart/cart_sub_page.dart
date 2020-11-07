import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/hero_widget.dart';
import 'package:second_app/features/presentation/pages/cart/cart_detail_page.dart';
import 'package:tuple/tuple.dart';

class CartSubPage extends StatelessWidget {
  const CartSubPage({Key key}) : super(key: key);

  static const List<Tuple3> tutorials = [
    const Tuple3<String, String, String>(
      'https://i.ytimg.com/vi/aqz-KE-bpKQ/maxresdefault.jpg',
      'Big Buck Bunny mp4🚀',
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
    const Tuple3<String, String, String>(
      'https://i.imgur.com/XXI3y4g.jpg',
      'CyberPunk backgrounds #2 😪',
      'https://cdn-l-cyberpunk.cdprojektred.com/video/CP77_web_loop_4K_June_Beat_trailer_2020.mp4',
    ),
    const Tuple3<String, String, String>(
      'https://images.wallpapersden.com/image/download/background-of-cyberpunk-game_71766_3840x2160.jpg',
      'CyberPunk backgrounds #3 👍',
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
    const Tuple3<String, String, String>(
      'https://thumbs.gfycat.com/BareFlashyAsiaticmouflon-size_restricted.gif',
      'CyberPunk backgrounds #4 ☘️',
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
    const Tuple3<String, String, String>(
      'https://wallpaperaccess.com/full/676037.jpg',
      'CyberPunk backgrounds #5 👻',
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
    const Tuple3<String, String, String>(
      'https://cdn.hipwallpaper.com/i/78/45/ZLg91k.jpg',
      'CyberPunk backgrounds #6 🦨',
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
    const Tuple3<String, String, String>(
      'https://i.redd.it/qpi1ob3ior331.png',
      'CyberPunk backgrounds #7',
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
    const Tuple3<String, String, String>(
      'https://external-preview.redd.it/U70WzpsaBilnO0ixDP17jYN6tr-2RuHn-qpGKlyntqs.jpg?auto=webp&s=1efdd946bcde188ec18cd7572020a25bb26b4ac7',
      'CyberPunk backgrounds #8',
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
    const Tuple3<String, String, String>(
      'https://i.ytimg.com/vi/gSaosmXT0FU/maxresdefault.jpg',
      'CyberPunk backgrounds #9',
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
    const Tuple3<String, String, String>(
      'https://gamertweak.com/wp-content/uploads/2019/07/cyberpunk-2077-three-staring-characters-1280x720.jpg',
      'CyberPunk backgrounds #10',
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverContent(),
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

  Widget _buildListItem(BuildContext context, Tuple3 tutorial) {
    return Stack(
      children: <Widget>[
        _buildCardView(tutorial.item2, tutorial.item1),
        _buildRippleEffectNavigation(
            context, tutorial.item2, tutorial.item1, tutorial.item3)
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
      BuildContext context, String desc, String imageUrl, String videoUrl) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.purple.withOpacity(0.5),
          highlightColor: Colors.purple.withOpacity(0.5),

          // ######### Return the video from the internet ##########
          onTap: () {
            Navigator.of(context).push(
              _createTutorialDetailRoute(desc, imageUrl, videoUrl),
            );
          },

          // ########  FilePicker to get video path from phone storage  #########
          // onTap: () async {
          //   File videoFile = await FilePicker.getFile(type: FileType.any);
          //   if (videoFile != null) {
          //     videoUrl = videoFile.path;
          //     Navigator.of(context).push(
          //       _createTutorialDetailRoute(desc, imageUrl, videoUrl),
          //     );
          //   }
          // },
        ),
      ),
    );
  }

  PageRoute<Object> _createTutorialDetailRoute(desc, imageUrl, videoUrl) {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.ease))
              .animate(animation),
          child: FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: Curves.ease))
                .animate(animation),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) => CartDetailPage(
        heroTag: imageUrl,
        desc: desc,
        videoUrl: videoUrl,
      ),
    );
  }
}
