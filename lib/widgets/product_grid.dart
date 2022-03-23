import 'package:flutter/material.dart';
import 'package:online_shopping_app/model/products.dart';
import 'package:online_shopping_app/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  ProductGrid({Key? key}) : super(key: key);
  Products products = Products();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (ctx, index) => ProductItem(
              title: products.items[index].title,
              imgUrl: products.items[index].imageURL,
            ));
  }
}
