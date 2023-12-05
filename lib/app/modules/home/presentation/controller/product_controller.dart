import 'package:flutter_template_3/app/core/base/base_controller.dart';
import 'package:flutter_template_3/app/modules/home/data/models/product.dart';
import 'package:get/get.dart';

class ProductController extends BaseController<List<Product>>{
  List<Product> products = [];
  @override
  void onInit() {
    super.onInit();
    for(int i=0; i<4; i++){
      products.add(Product(
        id: i+1,
        name: "Bluebell Hand Block Dress",
        productImage: 'https://previews.123rf.com/images/indiraswork/indiraswork2004/indiraswork200400122/145863541-beautiful-brunette-woman-natural-make-up-wear-fashion-clothes-casual-dress-code-office-style-blue.jpg',
        basePrice: 80,
        price: 75,
        review: 2
      ));
    }
    loadData();
  }

  @override
  Future loadData() async {
    super.loadData();
    change(products, status: RxStatus.success());
  }
}
