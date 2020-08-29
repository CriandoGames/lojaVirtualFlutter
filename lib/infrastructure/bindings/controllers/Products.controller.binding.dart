import 'package:get/get.dart';
import 'package:loja_virtual/presentation/product/controllers/product.controller.dart';

class ProductControllerBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<ProductController>(() => ProductController(product: Get.arguments));
  }
}
