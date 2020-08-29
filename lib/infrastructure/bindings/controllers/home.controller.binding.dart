import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/provider/firebase.dart';
import 'package:loja_virtual/infrastructure/repository/user_manager.repository.dart';
import 'package:loja_virtual/presentation/home/controllers/home.controller.dart';

class HomeControllerBinging extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(
            repository: RepositoryUserManage(fireBase: FireBase())),
        fenix: true);
  }
}
