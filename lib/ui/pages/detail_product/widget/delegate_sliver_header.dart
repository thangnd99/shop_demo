import 'package:flutter/material.dart';

class DelegateSliverHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final double height;

  const DelegateSliverHeader({
    required this.widget,
    this.height = 50,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height / 2;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
