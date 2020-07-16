import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/presentation/home/controllers/home.controller.dart';
import 'package:loja_virtual/presentation/home/widgets/custom.Drawer.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(),
          body: Container(),
        )
      ],
    );
  }
}
