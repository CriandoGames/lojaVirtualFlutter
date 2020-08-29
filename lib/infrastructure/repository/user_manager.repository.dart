import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/model/user.model.dart';
import 'package:loja_virtual/infrastructure/provider/firebase.dart';

class RepositoryUserManage {
  final FireBase fireBase;

  RepositoryUserManage({this.fireBase}) : assert(fireBase != null);

  UserModel currentUser = UserModel();

  Future<void> signIn(
      {UserModel user,
      Function onFail,
      Function onSucess,
      RxBool isLoading}) async {
    await fireBase.signIn(
        user: user, onFail: onFail, onSucess: onSucess, isloading: isLoading);
  }

  //cadastro de Usuario
  Future<void> signUp(
      {UserModel user,
      Function onFail,
      Function onSucess,
      RxBool isloading}) async {
    fireBase.signUp(
        user: user, isloading: isloading, onFail: onFail, onSucess: onSucess);
  }

  Future<void> signOut() async {
    await fireBase.signOut();
    
  }

  Future<void> getCurrentUser() async {
    currentUser = await fireBase.loadCurrentUser();
  }
}
