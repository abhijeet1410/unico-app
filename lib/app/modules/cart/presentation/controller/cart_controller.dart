import 'package:unico_app/app/core/base/base_controller.dart';
import 'package:unico_app/app/modules/home/data/models/product.dart';
import 'package:get/get.dart';

class CartController extends BaseController<List<Product>>{
  List<Product> products = [];

  updateCart(Product product){
    int index = products.indexWhere((element) => element.id == product.id);
    if(index == -1){
      products.add(product);
    } else {
      products.removeAt(index);
    }
    update();
    if(products.isEmpty){
      change(products, status: RxStatus.empty());
    }
    change(products, status: RxStatus.success());
  }

  bool isProductAvailable(Product product){
    int index = products.indexWhere((element) => element.id == product.id);
    return index != -1;
  }

  @override
  void onInit() {
    super.onInit();
    change(products, status: RxStatus.empty());
  }
}