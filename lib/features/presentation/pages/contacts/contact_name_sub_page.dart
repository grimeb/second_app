import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/hero_widget.dart';
import 'package:second_app/features/presentation/pages/contacts/contact_name_detail_page.dart';

import 'package:tuple/tuple.dart';

class ContactNameSubPage extends StatelessWidget {
  static const List<Tuple2> tutorials = [
    const Tuple2<String, String>(
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ecddb36f-5eb5-4270-8640-c1e0a73c3f2b/d9mot04-4560f2ec-0f4e-4fe8-8b7a-b045b10d0d4c.png/v1/fill/w_1024,h_975,q_80,strp/random_profile_picture_by_skybonthebunny_d9mot04-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD05NzUiLCJwYXRoIjoiXC9mXC9lY2RkYjM2Zi01ZWI1LTQyNzAtODY0MC1jMWUwYTczYzNmMmJcL2Q5bW90MDQtNDU2MGYyZWMtMGY0ZS00ZmU4LThiN2EtYjA0NWIxMGQwZDRjLnBuZyIsIndpZHRoIjoiPD0xMDI0In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.d4FaId6IvhuHvqW05qX_Q4Ngu6gQmG_dmlVRJTIyS_g',
      'Jessica Rhodes 🚀',
    ),
    const Tuple2<String, String>(
      'https://miro.medium.com/max/400/1*B8c1ED3QV_yaa6PAWqDgMw.png',
      'John Tobin 🔥',
    ),
    const Tuple2<String, String>(
      'https://scontent.fmia1-2.fna.fbcdn.net/v/t1.0-9/52381273_240823366871590_3962082497059094528_o.png?_nc_cat=109&ccb=2&_nc_sid=09cbfe&_nc_ohc=RqSDnnDy3EsAX_mvPur&_nc_ht=scontent.fmia1-2.fna&oh=58221e0aa01ced8c68d9872da7d706e7&oe=5FC6CD9F',
      'Will Simmons 👍',
    ),
    const Tuple2<String, String>(
      'https://pm1.narvii.com/6636/ddaf1c402f3767d7c934aac8520aa12c023fd31c_00.jpg',
      'Jeff Garner ☘️',
    ),
    const Tuple2<String, String>(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRP2znm2BD8Q-Urpfkbvf-kYE7CKWHS3e545g&usqp=CAU',
      'Ken Atwater 👻',
    ),
    const Tuple2<String, String>(
      'https://i.imgur.com/PNQcxQ0.gif',
      'Doug Stanley 🦨',
    ),
    const Tuple2<String, String>(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTLp4slTfHs-dVyK7qNWw9_BVnuPUV0n1sXbw&usqp=CAU',
      'Dennis Lane 💩',
    ),
    const Tuple2<String, String>(
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e54505d6-222b-4392-927e-d47a3edf7de4/dd6k34x-256cbcc9-d353-40a5-b9ff-2515faf34839.png/v1/fill/w_800,h_683,q_80,strp/random_profile_pict_by_onebyone01_dd6k34x-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD02ODMiLCJwYXRoIjoiXC9mXC9lNTQ1MDVkNi0yMjJiLTQzOTItOTI3ZS1kNDdhM2VkZjdkZTRcL2RkNmszNHgtMjU2Y2JjYzktZDM1My00MGE1LWI5ZmYtMjUxNWZhZjM0ODM5LnBuZyIsIndpZHRoIjoiPD04MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.71f6kY5z4itrzsRcoiQxp--8P8Z8A48pY24yahjjFBs',
      'Lisa McCarthy 😸',
    ),
    const Tuple2<String, String>(
      'https://pbs.twimg.com/profile_images/1275361395329163265/5RXRsCeU_400x400.jpg',
      'Tiffany Ariana Trump 🤢',
    ),
    const Tuple2<String, String>(
      'https://carbonmade-media.accelerator.net/32566035;960x744.png?auto=webp',
      'Dan Sierra 💪',
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
            ContactNameDetailPage(
                heroTag: imageUrl, desc: desc, imageUrl: imageUrl));
  }
}
