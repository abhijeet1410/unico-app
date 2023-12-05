import 'package:flutter_template_3/app/core/base/base_controller.dart';
import 'package:flutter_template_3/app/modules/cart/presentation/controller/cart_controller.dart';
import 'package:flutter_template_3/app/modules/home/data/models/product.dart';
import 'package:flutter_template_3/app/modules/home/presentation/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductDetailController extends BaseController<Product> {
  late Product product;
  late int productId;
  late CartController cartController;

  ProductDetailController(this.productId);

  @override
  void onInit() {
    super.onInit();
    loadData();
    cartController = Get.find<CartController>();
  }

  @override
  Future loadData() async {
    super.loadData();
    product = Get.find<ProductController>().state![Get.find<ProductController>()
        .state!
        .indexWhere((element) => element.id == productId)];
    change(product, status: RxStatus.success());
  }

  void addToCart() {
    cartController.updateCart(product);
    update();
  }
}
