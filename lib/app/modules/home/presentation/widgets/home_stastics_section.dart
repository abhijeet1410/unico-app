import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unico_app/app/core/asset/resources.dart';
import 'package:get/get.dart';

///
/// Created by Kumar Sunil on 27-11-2023
///
class HomeStatisticsSection extends StatelessWidget {
  const HomeStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            "YOUR STATS",
            style: TextStyle(
              color: Color(0xff6C6C6C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GridView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 14,
            childAspectRatio: 1.3,
          ),
          children: [
            StatisticTile(
              title: "Today’s Preorders",
              value: "12",
              onTap: () {},
            ),
            StatisticTile(
              title: "Upcoming Preorders",
              value: "12",
              onTap: () {},
            ),
            StatisticTile(
              title: "Today’s Orders",
              value: "12",
              onTap: () {},
            ),
            StatisticTile(
              title: "Today’s sales",
              value: "₹12",
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}

class StatisticTile extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;

  const StatisticTile(
      {required this.title, this.onTap, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            if (onTap != null)
              Material(
                type: MaterialType.circle,
                color: Get.theme.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    AppAssets.arrowNext,
                    height: 24,
                    width: 24,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
