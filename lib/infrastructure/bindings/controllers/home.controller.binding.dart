import 'package:get/get.dart';
import 'package:loja_virtual/presentation/home/controllers/home.controller.dart';

class HomeControllerBinging extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
