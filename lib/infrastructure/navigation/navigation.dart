import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/bindings/controllers/Products.controller.binding.dart';
import 'package:loja_virtual/infrastructure/bindings/controllers/cadastro.controller.binding.dart';
import 'package:loja_virtual/infrastructure/bindings/controllers/home.controller.binding.dart';
import 'package:loja_virtual/infrastructure/bindings/controllers/login.controller.binding.dart';
import 'package:loja_virtual/infrastructure/navigation/routes.dart';
import 'package:loja_virtual/presentation/cadastro/cadastro.screen.dart';
import 'package:loja_virtual/presentation/home/home.screen.dart';
import 'package:loja_virtual/presentation/login/login.screen.dart';
import 'package:loja_virtual/presentation/product/product.screen.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
        binding: HomeControllerBinging()),
    GetPage(
        name: Routes.CADASTRO,
        page: () => CadastroScreen(),
        binding: CadastroControllerBinding()),
        GetPage(
        name: Routes.PRODUCTS,
        page: () => ProductScreen(),
        binding: ProductControllerBinding(),
       ),
  ];
}
