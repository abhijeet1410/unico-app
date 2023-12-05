import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/utils/navigation_utils/navigation_helper.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_back_button.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/modules/cart/presentation/controller/cart_controller.dart';
import 'package:flutter_template_3/app/modules/checkout/presentation/checkout_page.dart';
import 'package:flutter_template_3/app/modules/home/presentation/widgets/product_tile.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart';

  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const AppBackButton(),
        centerTitle: true,
        title: const Text("Cart",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          controller.obx((state) {
            if (state != null && controller.status.isSuccess) {
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.state!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      ProductTile(state[index]),
                ).paddingOnly(bottom: 16),
              );
            }
            return const SizedBox.shrink();
          }, onLoading: const CircularProgressIndicator()),
          AppPrimaryButton(
            child:
                Text('Proceed to checkout (${controller.state!.length} Items)'),
            onPressed: () {
              NavigationHelper.toNamed(CheckoutPage.routeName);
            },
          )
        ],
      )),
    );
  }
}
