import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unico_app/app/core/widgets/app_widgets/app_loader.dart';
import 'package:unico_app/app/core/widgets/user_circle_avatar.dart';
import 'package:unico_app/app/modules/home/presentation/controller/product_controller.dart';
import 'package:unico_app/app/modules/home/presentation/widgets/featured_product.dart';
import 'package:unico_app/app/modules/home/presentation/widgets/product_tile.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<ProductController> {
  static const String routeName = '/home';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: UserCircleAvatar(
              'https://www.pinclipart.com/picdir/middle/355-3553881_stockvader-predicted-adig-user-profile-icon-png-clipart.png'),
        ),
        title: const Text(
          "Hello Roopa",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
                height: 150.0,
                width: 40.0,
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.notifications_none,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      Positioned(
                          right: 0,
                          child: Stack(
                            children: <Widget>[
                              Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.deepOrange[800]),
                              const Positioned(
                                  top: 3.0,
                                  right: 0,
                                  left: 0,
                                  child: Center(
                                    child: Text(
                                      "3",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          ))
                    ],
                  ),
                )),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffFEEC8D).withOpacity(0.6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Featured Now',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("See All"),
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.black),
                    )
                  ],
                ),
                controller.obx((state) {
                  if (state != null && controller.status.isSuccess) {
                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: controller.state!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (c, i) =>
                            FeaturedProduct(controller.state![i]),
                      ),
                    );
                  }
                  return SizedBox.shrink();
                }, onLoading: AppProgress()),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Featured Offer For You',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("See All"),
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (c, i) => Container(
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  width: 180,
                                  height: 100,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://picturedensity.com/wp-content/uploads/2019/07/durga-sale-banner.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Get Flat \$75 Back",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "Up to 40% Off",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: 160,
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black)),
                                child: const Center(
                                  child: Text(
                                    'Collect Now',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffFBEFDB).withOpacity(0.6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Great Saving On Everyday Essentials',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Up To 60% Off + Up To \$100 Cashback',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ).paddingOnly(top: 8, bottom: 12),
                controller.obx((state) {
                  if (state != null && controller.status.isSuccess) {
                    return GridView.builder(
                      itemCount: controller.state!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          ProductTile(state[index]),
                    ).paddingOnly(bottom: 16);
                  }
                  return const SizedBox.shrink();
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
