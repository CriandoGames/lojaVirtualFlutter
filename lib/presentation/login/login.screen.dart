import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/model/user.model.dart';
import 'package:loja_virtual/infrastructure/navigation/routes.dart';
import 'package:loja_virtual/presentation/login/controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                Get.offNamed(Routes.CADASTRO);
              },
              textColor: Colors.white,
              child: const Text(
                "Criar Conta",
                style: TextStyle(fontSize: 16),
              ))
        ],
        title: const Text("Entrar"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() {
              return Form(
                  key: formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        controller: controller.email,
                        enabled: !controller.isLoading.value,
                        decoration: const InputDecoration(hintText: 'E-mail'),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (email) {
                          if (!GetUtils.isEmail(email)) {
                            return "Email Invalido";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: controller.senha,
                        enabled: !controller.isLoading.value,
                        decoration: const InputDecoration(hintText: 'Senha'),
                        obscureText: true,
                        autocorrect: false,
                        validator: (senha) {
                          if (senha.isEmpty || senha.length < 6) {
                            return "Senha Inválida";
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: const Text("Esqueci minha senha"),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 44,
                        child: !controller.isLoading.value
                            ? RaisedButton(
                                onPressed: () {
                                  print(controller.email.text);
                                  print(controller.senha.text);
                                  if (formKey.currentState.validate())
                                    controller.repository.signIn(
                                        user: UserModel(
                                          email: controller.email.text,
                                          password: controller.senha.text,
                                        ),
                                        onFail: (e) {
                                          controller.showErro(e);
                                        },
                                        onSucess: controller.onSucess,
                                        isLoading: controller.isLoading);

                                  controller.email.text = "";
                                  controller.senha.text = "";
                                },
                                child: const Text(
                                  "Entrar",
                                  style: TextStyle(fontSize: 18),
                                ),
                                textColor: Colors.white,
                                color: Theme.of(context).primaryColor,
                              )
                            : Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ));
            })),
      ),
    );
  }
}
