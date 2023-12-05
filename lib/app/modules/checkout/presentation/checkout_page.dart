import 'package:flutter/material.dart';
import 'package:unico_app/app/core/utils/navigation_utils/navigation_helper.dart';
import 'package:unico_app/app/core/widgets/app_buttons/app_back_button.dart';
import 'package:unico_app/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:unico_app/app/modules/cart/presentation/controller/cart_controller.dart';
import 'package:unico_app/app/modules/home/presentation/widgets/product_tile.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  static const routeName = '/checkout';
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late CartController controller;
  int totalPrice = 0;
  int discount = 0;
  int finalPrice = 0;

  @override
  void initState() {
    super.initState();
    controller = Get.find<CartController>();
    for(var product in controller.state!){
      totalPrice += product.basePrice;
      finalPrice += product.price;
    }
    discount = totalPrice - finalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const AppBackButton(),
        centerTitle: true,
        title: const Text("Checkout",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Items: ", style: TextStyle(
                    fontSize: 16
                  ),),
                  Text(controller.state!.length.toString(), style: const TextStyle(
                      fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ).paddingSymmetric(horizontal: 16),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Price: ", style: TextStyle(
                    fontSize: 16
                  ),),
                  Text("\$$totalPrice", style: const TextStyle(
                      fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ).paddingSymmetric(horizontal: 16),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Discount: ", style: TextStyle(
                    fontSize: 16
                  ),),
                  Text("\$$discount", style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ).paddingSymmetric(horizontal: 16),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Final Price: ", style: TextStyle(
                    fontSize: 16
                  ),),
                  Text("\$$finalPrice", style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ).paddingSymmetric(horizontal: 16),
              const SizedBox(height: 12,),
              AppPrimaryButton(
                child:
                const Text('Proceed to Pay'),
                onPressed: () {
                  NavigationHelper.toNamed(CheckoutPage.routeName);
                },
              )
            ],
          )),
    );
  }
}
