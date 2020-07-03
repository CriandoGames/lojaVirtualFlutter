import 'package:get/get.dart';
import 'package:loja_virtual/presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
