import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/utils/navigation_utils/navigation_helper.dart';
import 'package:flutter_template_3/app/modules/home/data/models/product.dart';
import 'package:flutter_template_3/app/modules/product/presentation/product_page.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("PRODUCT ${product.id}");
        NavigationHelper.toNamed(ProductPage.routeName, parameters: {
          'product': product.id.toString()
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
                child: SizedBox(
                    height: 160,
                    width: Get.width,
                    child: CachedNetworkImage(
                      imageUrl:
                      product.productImage,
                      fit: BoxFit.cover,
                    ))),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8, horizontal: 16),
              child: Text(
                product.name,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16),
              child: RichText(
                text: TextSpan(
                  text: '\$${product.price} ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\$${product.basePrice}',
                        style: TextStyle(
                            decoration:
                            TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400])),
                    const TextSpan(
                        text: '  Free Delivery',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
