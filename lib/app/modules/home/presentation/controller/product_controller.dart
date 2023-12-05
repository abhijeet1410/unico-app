import 'package:unico_app/app/core/base/base_controller.dart';
import 'package:unico_app/app/modules/home/data/models/product.dart';
import 'package:get/get.dart';

class ProductController extends BaseController<List<Product>> {
  List<Product> products = [];

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < 4; i++) {
      products.add(Product(
          id: i + 1,
          name: i == 0
              ? "Bluebell Hand Block Dress"
              : i == 0
                  ? "RedBell Hand Block Dress"
                  : i == 1
                      ? "Pink Suit"
                      : "Blue Polka One Piece Dress",
          productImage: i == 0
              ? 'https://previews.123rf.com/images/indiraswork/indiraswork2004/indiraswork200400122/145863541-beautiful-brunette-woman-natural-make-up-wear-fashion-clothes-casual-dress-code-office-style-blue.jpg'
              : i == 1
                  ? 'https://images.pexels.com/photos/1377451/pexels-photo-1377451.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
                  : i == 2
                      ? 'https://assets.ajio.com/medias/sys_master/root/20230611/Fnkm/6485f42c42f9e729d736f24b/-473Wx593H-466254348-pink-MODEL.jpg'
                      : 'https://imgshopimages.lbb.in/catalog/product/c/y/cyu46-2.jpg',
          basePrice: 80 + i * 2,
          price: 75 + i * 2,
          review: 2));
    }
    loadData();
  }

  @override
  Future loadData() async {
    super.loadData();
    change(products, status: RxStatus.success());
  }
}
