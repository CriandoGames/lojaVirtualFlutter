import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/common/util/snackbar.dart';
import 'package:loja_virtual/presentation/cadastro/controllers/cadastro.controller.dart';

class CadastroScreen extends GetView<CadastroController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Obx(() {
            return Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                children: [
                  TextFormField(
                    enabled: !controller.isLoading.value,
                    decoration:
                        const InputDecoration(hintText: "Nome Completo"),
                    onSaved: (name) => controller.user.name = name,
                    validator: (nome) {
                      if (nome.isEmpty) {
                        return "Campo  Obrigatório";
                      } else if (nome.trim().split(" ").length <= 1) {
                        return "Preeche o nome e sobrenome";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    enabled: !controller.isLoading.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: "E-mail"),
                    onSaved: (email) => controller.user.email = email,
                    validator: (email) {
                      if (!GetUtils.isEmail(email)) return "E-mail invalido";

                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    enabled: !controller.isLoading.value,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Senha"),
                    onSaved: (senha) => controller.user.password = senha,
                    validator: (senha) {
                      if (senha.isEmpty || senha.length < 6) {
                        return "Senha Inválida";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    enabled: !controller.isLoading.value,
                    onSaved: (senha) => controller.user.confirpassword = senha,
                    obscureText: true,
                    decoration:
                        const InputDecoration(hintText: "Repita a senha"),
                    validator: (senha) {
                      if (senha.isEmpty || senha.length < 6) {
                        return "Senha Inválida";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                      disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                      onPressed: controller.isLoading.value ? null : () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();

                          if (controller.user.password ==
                              controller.user.confirpassword) {
                            controller.repository.signUp(
                                isloading: controller.isLoading,
                                onFail: (e) {
                                  controller.showErro(e);
                                },
                                onSucess: controller.onSucess,
                                user: controller.user);
                          } else {
                            SnackbarUtil.showError("Senhas não coincidem!");
                          }
                        }
                      },
                      child: controller.isLoading.value ? CircularProgressIndicator(): const Text(
                        "Entrar",
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
