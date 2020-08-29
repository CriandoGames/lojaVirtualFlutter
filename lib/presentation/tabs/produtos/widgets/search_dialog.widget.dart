import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/presentation/tabs/produtos/controller/products.controller.dart';

class SearchDialogWidget extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 2,
            left: 4,
            right: 4,
            child: Card(
              child: TextFormField(
                textInputAction: TextInputAction.search,
                autofocus: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.grey[700],
                      onPressed: () {
                        Get.back();
                      },
                    )),
                onFieldSubmitted: (text) {
                 // Get.back(texto);
                  Navigator.of(context).pop(text);
                },
              ),
            ))
      ],
    );
  }
}
