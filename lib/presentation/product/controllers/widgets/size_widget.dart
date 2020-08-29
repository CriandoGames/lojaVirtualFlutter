import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/model/item_size.model.dart';
import 'package:loja_virtual/presentation/product/controllers/product.controller.dart';

class SizeWidget extends GetView<ProductController> {
  final ItemSizeModel size;

  SizeWidget({@required this.size});

  @override
  Widget build(BuildContext context) {
    print('build $size');
    final selected = (size == controller.product.selectedsize).obs;

    

    return Obx(() {
      return new GestureDetector(
        onTap: () {
          if (size.hasStock) {
            controller.product.selectedsize = size;
            selected.value = controller.product.selectedsize == size;
            controller.selected.value = selected.value;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: controller.getColor(size.hasStock, selected.value),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: controller.getColor(size.hasStock, selected.value),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  size.name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "R\$: " + size.price.toStringAsFixed(2),
                  style: TextStyle(
                    color: controller.getColor(size.hasStock, selected.value),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
