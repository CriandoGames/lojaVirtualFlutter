import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/navigation/routes.dart';
import 'package:loja_virtual/presentation/home/controllers/home.controller.dart';

class CustomDrawerHeader extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: GetX(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Loja do \nCarlos",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text("Olá,  ${controller.user.value?.name ?? ''}",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            GestureDetector(
                onTap: () async {
                  if (controller.user.value != null) {
                    await controller.repository.signOut();
                    controller.user.value = null;
                  } else {
                    Get.toNamed(Routes.LOGIN);
                  }
                },
                child: Visibility(
                  visible: controller.user.value != null,
                  child: Text(
                    "Sair",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  replacement: Text(
                    "Entre ou Cadastre-se",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        );
      }),
    );
  }
}
