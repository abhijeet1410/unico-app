import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/pages/grid/presentation/grid_page.dart';
import 'package:flutter_template_3/app/core/theme/app_colors.dart';
import 'package:flutter_template_3/app/core/widgets/app_widgets/app_widgets.dart';
import 'package:flutter_template_3/app/core/widgets/user_circle_avatar.dart';
import 'package:flutter_template_3/app/modules/home/presentation/controller/home_controller.dart';
import 'package:flutter_template_3/app/modules/home/presentation/widgets/home_stastics_section.dart';
import 'package:flutter_template_3/app/modules/home/presentation/widgets/machines_section.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<HomeController> {
  static const String routeName = '/home';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 52,
        titleSpacing: 8,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Center(
            child: UserCircleAvatar(
              "https://images.pexels.com/photos/3714786/pexels-photo-3714786.jpeg?auto=compress&cs=tinysrgb&w=600",
              radius: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              placeholder: const ImagePlaceholder(
                width: 28,
                height: 28,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sanu Family Restaurant",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 14),
            ),
            Text(
              "Chandrashekharpur",
              style: TextStyle(
                color: Color(0xff4D4D4D),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(AppAssets.notification))
        ],
      ),
      body: ListView(
        children: [
          HomeStatisticsSection(),
          HomeMachinesSection(),
        ],
      ),
    );
  }
}
