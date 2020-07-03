class Routes {
  static Future<String> get initialRoute async {
    return LOGIN;
  }

  static const LOGIN = 'login';
  static const CADASTRO = 'cadastro';
  static const HOME = 'home';
}
