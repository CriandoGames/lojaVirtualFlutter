import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/common/util/custom.Drawer.dart';
import 'package:loja_virtual/infrastructure/navigation/routes.dart';
import 'package:loja_virtual/infrastructure/provider/firebase.dart';
import 'package:loja_virtual/infrastructure/repository/product_manager.repository.dart';
import 'package:loja_virtual/presentation/tabs/produtos/controller/products.controller.dart';
import 'package:loja_virtual/presentation/tabs/produtos/widgets/product_list_tile.widget.dart';
import 'package:loja_virtual/presentation/tabs/produtos/widgets/search_dialog.widget.dart';

class ProductsTabScreen extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductsController>(() => ProductsController(
        repository: RepositoryProductManager(fireBase: FireBase())));

    return Scaffold(
        appBar: AppBar(
          title: Obx(() {
            return Visibility(
              child: Text("Produtos"),
              replacement: Text(controller.repository.search.value),
              visible: controller.repository.search.value.isEmpty,
            );
          }),
          centerTitle: true,
          actions: [
            Obx(() {
              return Visibility(
                visible: controller.repository.search.value.isEmpty,
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context, builder: (_) => SearchDialogWidget());
                    if (search != null)
                      controller.repository.search.value = search;
                  },
                ),
                replacement: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    controller.repository.search.value = "";
                  },
                ),
              );
            })
          ],
        ),
        drawer: CustomDrawer(),
        body: Obx(() {
          controller.allProducts.value =
              controller.repository.fiteredProducts.value;
          return Visibility(
            visible: controller.allProducts.value.isNotEmpty,
            child: ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: controller.allProducts.value.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.PRODUCTS,arguments: controller.allProducts.value[index]);
                  },
                  child: ProductListTile(
                      product: controller.allProducts.value[index]),
                );
              },
            ),
            replacement: Text("Carregando"),
          );
        }));
  }
}
