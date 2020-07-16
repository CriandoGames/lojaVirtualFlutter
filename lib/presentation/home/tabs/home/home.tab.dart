import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/presentation/home/controllers/home.controller.dart';

class HomeTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        controller.buildBodyBack(),
      ],
    );
  }
}
