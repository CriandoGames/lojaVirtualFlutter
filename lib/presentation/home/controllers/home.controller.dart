import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/model/user.model.dart';
import 'package:loja_virtual/infrastructure/repository/user_manager.repository.dart';

class HomeController extends GetxController {
  final Rx<PageController> pageController = PageController().obs;
  final RepositoryUserManage repository;
  Rx<UserModel> user = Rx<UserModel>();

  int currentPage = 0;
  HomeController({@required this.repository}) : assert(repository != null) {
    repository.getCurrentUser().whenComplete(() {
      if (repository.currentUser != null) user.value = repository.currentUser;

      //iniciar produtos
    });
  }

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
