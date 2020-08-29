import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/infrastructure/model/item_size.model.dart';

class ProductModel {
  ProductModel.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    description = document.data()['description'] as String;
    images = List<String>.from(document.data()["images"] as List<dynamic>);
    sizes = (document.data()['sizes'] as List<dynamic> ?? [])
        .map((e) => ItemSizeModel.fromMap(e))
        .toList();
  }

  String id;
  String name;
  String description;
  List<String> images;
  List<ItemSizeModel> sizes;
  final Rx<ItemSizeModel> _selectedsize = Rx<ItemSizeModel>();

  ItemSizeModel get selectedsize => _selectedsize.value;

  set selectedsize(ItemSizeModel value) {
    _selectedsize.value = value;
    Get.forceAppUpdate();
    print(value);
  }

  int get totalStock {
    int stock = 0;
    for (final s in sizes) {
      stock += s.stock;
    }
    return stock;
  }

  bool get hasStock {
    return totalStock > 0;
  }
}
