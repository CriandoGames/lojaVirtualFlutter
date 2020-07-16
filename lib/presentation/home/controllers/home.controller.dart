import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<PageController> pageController = PageController().obs;
  int currentPage = 0;

  void setPage(int page) {
    if (page == currentPage) return;

    currentPage = page;
    pageController.value.jumpToPage(page);
  }

  Widget buildBodyBack() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 211, 118, 130),
        Color.fromARGB(255, 253, 181, 168)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    );
  }
}
