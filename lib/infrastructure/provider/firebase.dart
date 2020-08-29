import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/common/help/get_Error_firbase.dart';
import 'package:loja_virtual/infrastructure/model/product.model.dart';
import 'package:loja_virtual/infrastructure/model/user.model.dart';

class FireBase {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  User user;

//Referencias
  DocumentReference get firestoreRefUser => db.doc('users/' + user.uid);

//#Provider#

//Login
  Future<void> signIn(
      {UserModel user,
      Function onFail,
      Function onSucess,
      RxBool isloading}) async {
    isloading.value = true;

    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      this.user = result.user;
      await loadCurrentUser(firebaseUser: result.user);

      onSucess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
      //  print(e.code);
    }

    isloading.value = false;
  }

//Logout
  Future<void> signOut() async {
    await auth.signOut();
  }

//recupera Usuario
  Future<UserModel> loadCurrentUser({User firebaseUser}) async {
    final User currentuser = firebaseUser ?? auth.currentUser;

    if (currentuser != null) {
      this.user = currentuser;

      final DocumentSnapshot documentSnapshot =
          await db.collection("users").doc(user.uid).get();

      return UserModel.fromDocument(documentSnapshot);
    } else {
      return null;
    }
  }

//cadastro de Usuario
  Future<void> signUp(
      {UserModel user,
      Function onFail,
      Function onSucess,
      RxBool isloading}) async {
    isloading.value = true;

    try {
      await auth
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password)
          .then((result) async {
        user.id = result.user.uid;
        this.user = result.user;

        await saveDataUser(user);
      });

      onSucess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }

    isloading.value = false;
  }

//SavaCadastro do usuario
  Future<void> saveDataUser(UserModel user) async {
    firestoreRefUser.set(user.toMap()).then((value) {
      print("Usuario Criado Com sucesso");
    });
  }

  Future<List<ProductModel>> loadAllProducts() async {
    final QuerySnapshot snapshot = await db.collection("products").get();
    List<ProductModel> allProducts = [];

    allProducts =
        snapshot.docs.map((e) => ProductModel.fromDocument(e)).toList();
    return allProducts;
    
  }
}
