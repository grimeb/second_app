import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverPersistentHeaderDelegateImpl
    extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color color;

  const SliverPersistentHeaderDelegateImpl({
    Color color = Colors.transparent,
    @required this.tabBar,
  }) : this.color = color;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // throw UnimplementedError();
    return Container(
      color: color,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;
  // throw UnimplementedError();

  @override
  double get minExtent => tabBar.preferredSize.height;
  // throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
    // throw UnimplementedError();
  }
}
