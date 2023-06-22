import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GridPageHeader extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget Function(BuildContext context, double percent)? builder;

  const GridPageHeader(
      {required this.maxHeight, this.minHeight = kToolbarHeight, this.builder});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = maxHeight - shrinkOffset;
    // final cardTopPosition = expandedHeight / 3 - shrinkOffset;
    final proportion = 2 - (maxHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    // final theme = Theme.of(context);

    return SizedBox(
        height: maxHeight,
        width: double.infinity,
        child: builder?.call(context, percent));
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => (minHeight) + Get.mediaQuery.viewPadding.top;

  @override
  bool shouldRebuild(GridPageHeader oldDelegate) {
    return maxHeight == oldDelegate.maxHeight;
  }
}
