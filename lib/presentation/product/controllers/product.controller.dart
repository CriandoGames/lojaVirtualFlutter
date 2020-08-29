import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:loja_virtual/infrastructure/model/product.model.dart';

class ProductController extends GetxController {
  ProductModel product;

  
 final selected = false.obs;

  Color getColor(bool hasStock, bool selected) {
    if (!hasStock)
      return Colors.red.withAlpha(50);
    else if (selected)
      return Theme.of(Get.context).primaryColor;
    else
      return Colors.grey;
  }

  ProductController({@required this.product});
}
