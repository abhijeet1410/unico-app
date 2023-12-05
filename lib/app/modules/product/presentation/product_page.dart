import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:unico_app/app/core/utils/navigation_utils/navigation_helper.dart';
import 'package:unico_app/app/core/widgets/app_buttons/app_back_button.dart';
import 'package:unico_app/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:unico_app/app/modules/cart/presentation/cart_page.dart';
import 'package:unico_app/app/modules/cart/presentation/controller/cart_controller.dart';
import 'package:unico_app/app/modules/product/presentation/controller/product_detail_controller.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/product';

  const ProductPage({Key? key}) : super(key: key);

  static String getRoute(requestId) {
    return '/product/$requestId';
  }

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductDetailController controller;
  late CartController cartController;
  late String productId;

  @override
  void initState() {
    super.initState();
    var args = Get.rootDelegate.parameters;
    productId = args['product']!;
    controller = Get.put(ProductDetailController(int.parse(productId)));
    cartController = Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const AppBackButton(),
        centerTitle: true,
        title: const Text("Product Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        actions: [
          GetBuilder(
            init: cartController,
            builder: (c) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  height: 150.0,
                  width: 40.0,
                  child: GestureDetector(
                    onTap: () {
                      NavigationHelper.toNamed(CartPage.routeName);
                    },
                    child: Stack(
                      children: <Widget>[
                        const IconButton(
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                          ),
                          onPressed: null,
                        ),
                        Positioned(
                            right: 0,
                            child: Stack(
                              children: <Widget>[
                                Icon(Icons.brightness_1,
                                    size: 20.0, color: Colors.deepOrange[800]),
                                Positioned(
                                    top: 3.0,
                                    right: 0,
                                    left: 0,
                                    child: Center(
                                      child: Text(
                                        "${controller.cartController.state!.length}",
                                        style: const TextStyle(
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
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    child: CarouselSlider(
                      items: [controller.product.productImage].map((image) {
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                              width: 700.0,
                            ),
                          ),
                        );
                      }).toList(),
                      options:
                          CarouselOptions(height: 340.0, viewportFraction: 1.5),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 15,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black26),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dress",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.deepOrangeAccent,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        '4.5',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '(470)',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                controller.state!.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                "Price: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              RichText(
                text: TextSpan(
                  text: '\$${controller.state!.price}  ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\$${controller.state!.basePrice}',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[400])),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                "Description: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in justo ut felis cursus auctor. Integer feugiat ultrices nisl, eget volutpat libero fermentum nec. Duis ut consectetur nunc. Quisque vehicula justo eu mi rhoncus, vel consequat elit fringilla",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.grey[500]),
              ),
            ],
          )),
          GetBuilder(
            init: cartController,
            builder: (c) => Container(
              height: 72,
              padding: const EdgeInsets.all(10),
              child: AppPrimaryButton(
                child: Text(
                    cartController.isProductAvailable(controller.product)
                        ? 'Go To Cart'
                        : 'Add To Cart'),
                onPressed: () {
                  bool isAvailable = cartController.isProductAvailable(controller.product);
                  if(isAvailable){
                    NavigationHelper.toNamed(CartPage.routeName);
                  } else {
                    cartController.updateCart(controller.product);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
