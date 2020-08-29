import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/model/product.model.dart';
import 'package:loja_virtual/infrastructure/provider/firebase.dart';

class RepositoryProductManager {
  final FireBase fireBase;

  Rx<List<ProductModel>> allProducts = Rx<List<ProductModel>>();

  RxString search = "".obs;

  RepositoryProductManager({@required this.fireBase})
      : assert(fireBase != null);

  Rx<List<ProductModel>> get fiteredProducts {
    final Rx<List<ProductModel>> fiteredProducts = Rx<List<ProductModel>>();
    fiteredProducts.value = [];

    if (search.value.isEmpty) {
      fiteredProducts.value.addAll(allProducts.value);
    } else {
      fiteredProducts.value.addAll(allProducts.value.where((element) =>
          element.name.toLowerCase().contains(search.value.toLowerCase())));
    }

    return fiteredProducts;
  }

  Future<void> loadAllProduct() async {
    allProducts.value = [];

    print("Foi chamado !!! ");
    allProducts.value = await fireBase.loadAllProducts();

    for (var temp in allProducts.value) {
      print(temp.name);
    }
  }
}
