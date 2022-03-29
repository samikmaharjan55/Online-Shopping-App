import 'package:flutter/material.dart';
import 'package:online_shopping_app/model/products.dart';
import 'package:online_shopping_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final bool isFavourite;
  ProductGrid(this.isFavourite);

  @override
  Widget build(BuildContext context) {
    final products = isFavourite
        ? Provider.of<Products>(context).favorites
        : Provider.of<Products>(context).items;
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: products[index],
              child: const ProductItem(),
            ));
  }
}
