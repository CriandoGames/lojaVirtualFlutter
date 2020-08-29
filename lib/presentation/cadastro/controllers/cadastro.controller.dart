import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/common/util/snackbar.dart';
import 'package:loja_virtual/infrastructure/model/user.model.dart';
import 'package:loja_virtual/infrastructure/navigation/routes.dart';
import 'package:loja_virtual/infrastructure/repository/user_manager.repository.dart';

class CadastroController extends GetxController {
  final RepositoryUserManage repository;
  CadastroController({@required this.repository}) : assert(repository != null);

 final isLoading = false.obs;
  UserModel user = UserModel();
  
  void showErro(String message) {
    SnackbarUtil.showError(message);
  }

  void onSucess() {
    repository.getCurrentUser();
    Get.offAllNamed(Routes.HOME);
  }
}
