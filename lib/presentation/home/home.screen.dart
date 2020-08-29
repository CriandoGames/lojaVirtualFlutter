import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/presentation/home/controllers/home.controller.dart';
import 'package:loja_virtual/common/util/custom.Drawer.dart';
import 'package:loja_virtual/presentation/tabs/produtos/products_tab.screen.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController.value,
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title: Text("Home")),
          drawer: CustomDrawer(),
          body: Container(),
        ),
        ProductsTabScreen(),
        Scaffold(
          appBar: AppBar(title: Text("Home 2")),
          drawer: CustomDrawer(),
          body: Container(),
        ),
        Scaffold(
          appBar: AppBar(title: Text("Home 3")),
          drawer: CustomDrawer(),
          body: Container(),
        ),
      ],
    );
  }
}
