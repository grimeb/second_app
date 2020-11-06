import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class NotificationsOnSubPage extends StatelessWidget {
  static const List<Tuple2> tutorials = [
    const Tuple2<String, String>(
      'https://blog.sagipl.com/wp-content/uploads/2018/01/Website-Ideas.jpg',
      'Website Ideas',
    ),
    const Tuple2<String, String>(
      'https://blog.sagipl.com/wp-content/uploads/2017/09/001-1.jpg',
      'Application Ideas',
    ),
    const Tuple2<String, String>(
      'https://www.upgrad.com/blog/wp-content/uploads/2020/08/shutterstock_1022040559.jpg',
      'Python Application Ideas',
    ),
    const Tuple2<String, String>(
      'https://res.cloudinary.com/practicaldev/image/fetch/s--GGKTcVoO--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/yw8hrtw5dx6sb5zz03qh.png',
      'C Sharp Projects',
    ),
    const Tuple2<String, String>(
      'https://www.raspberrypi.org/app/uploads/2018/03/RPi-Logo-Reg-SCREEN-199x250.png',
      'Raspberry Pi Projects',
    ),
    const Tuple2<String, String>(
      'https://cdn.hipwallpaper.com/i/78/45/ZLg91k.jpg',
      'CyberPunk backgrounds #6',
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
          return _buildListItem(tutorials[index]);
        },
        childCount: tutorials.length,
      ),
    );
  }

  Card _buildListItem(Tuple2 tutorial) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: NetworkImage(tutorial.item1, scale: 3),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 0),
              child: Text(
                tutorial.item2,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
