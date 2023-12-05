import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template_3/app/modules/home/data/models/product.dart';

class FeaturedProduct extends StatelessWidget {
  final Product product;
  const FeaturedProduct(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: 90,
                  child: CachedNetworkImage(
                    imageUrl:
                    product.productImage,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                product.name,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: '\$${product.price} ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '\$${product.basePrice}',
                            style: TextStyle(
                                decoration:
                                TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400])),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.deepOrangeAccent,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '(${product.review}k Reviews)',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "40% Off",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent),
              ),
            ],
          ).paddingOnly(right: 32),
        ],
      ),
    );
  }
}
