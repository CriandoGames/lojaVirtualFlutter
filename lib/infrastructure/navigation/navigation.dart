import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/bindings/controllers/login.controller.binding.dart';
import 'package:loja_virtual/infrastructure/navigation/routes.dart';
import 'package:loja_virtual/presentation/login/login.screen.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginControllerBinding(),
    ),
   // GetPage(name: Routes.CADASTRO, page: null, binding: null),
   // GetPage(name: Routes.HOME, page: null, binding: null),
  ];
}
