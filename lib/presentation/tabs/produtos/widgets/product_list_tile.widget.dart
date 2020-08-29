import 'package:flutter/material.dart';
import 'package:loja_virtual/infrastructure/model/product.model.dart';

class ProductListTile extends StatelessWidget {
  final ProductModel product;

  ProductListTile({@required this.product});

  @override
  Widget build(BuildContext context) {
    
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(product.images.first),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text("A partir de",
                      style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                ),
                Text(
                  "R\$: 19.99",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
