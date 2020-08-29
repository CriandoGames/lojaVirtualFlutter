import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/navigation/routes.dart';
import 'package:loja_virtual/presentation/home/controllers/home.controller.dart';
import 'controllers/product.controller.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'controllers/widgets/size_widget.dart';

class ProductScreen extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(controller.product.name),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              images: controller.product.images.map((e) {
                return NetworkImage(e);
              }).toList(),
              dotSize: 4,
              dotBgColor: Colors.transparent,
              dotColor: Theme.of(context).primaryColor,
              animationDuration: Duration(milliseconds: 500),
              autoplayDuration: const Duration(milliseconds: 3000),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  controller.product.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "A partir de",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ),
                Text(
                  "R\$: 19.99",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Descrição",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  controller.product.description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Tamanhos",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: controller.product.sizes.map((e) {
                      return SizeWidget(size: e);
                    }).toList()),
                const SizedBox(
                  height: 20,
                ),
                if(controller.product.hasStock)
                SizedBox(
                  height: 44,
                  child: Obx(() {
                    return RaisedButton(
                      onPressed: controller.product.selectedsize == null
                          ? null
                          : () {
                              if (Get.find<HomeController>()
                                      .repository
                                      .currentUser !=
                                  null) {
                                print("Adicionado");
                              } else
                                Get.toNamed(Routes.LOGIN);
                            },
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      child: Visibility(
                        visible:
                            Get.find<HomeController>().repository.currentUser !=
                                null,
                        child: Text(
                          "Adicionar Carrinho",
                          style: const TextStyle(fontSize: 18),
                        ),
                        replacement: Text(
                          "Entre para comprar",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
