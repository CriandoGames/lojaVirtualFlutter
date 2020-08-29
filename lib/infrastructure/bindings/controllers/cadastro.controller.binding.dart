import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/provider/firebase.dart';
import 'package:loja_virtual/infrastructure/repository/user_manager.repository.dart';
import 'package:loja_virtual/presentation/cadastro/controllers/cadastro.controller.dart';

class CadastroControllerBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<CadastroController>(() => CadastroController(
        repository: RepositoryUserManage(fireBase: FireBase())));
  }
}
