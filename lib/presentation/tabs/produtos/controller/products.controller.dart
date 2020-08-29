import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/model/product.model.dart';
import 'package:loja_virtual/infrastructure/repository/product_manager.repository.dart';

class ProductsController extends GetxController {
  final RepositoryProductManager repository;

  ProductsController({this.repository}) : assert(repository != null);

  Rx<List<ProductModel>> allProducts = Rx<List<ProductModel>>();
  
  

  @override
  void onInit() {
    repository.loadAllProduct();

    super.onInit();
  }
}
