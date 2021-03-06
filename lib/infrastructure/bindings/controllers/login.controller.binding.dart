import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/provider/firebase.dart';
import 'package:loja_virtual/infrastructure/repository/user_manager.repository.dart';

import 'package:loja_virtual/presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
        repository: RepositoryUserManage(fireBase: FireBase())));
  }
}
