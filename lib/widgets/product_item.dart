import 'package:flutter/material.dart';
import 'package:online_shopping_app/model/cart_provider.dart';
import 'package:online_shopping_app/model/product.dart';
import 'package:online_shopping_app/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: loadedProduct.id);
          },
          child: Image.network(
            loadedProduct.imageURL,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            loadedProduct.title,
            textAlign: TextAlign.center,
          ),
          leading: Consumer<Product>(
            builder: (_, prod, child) {
              return IconButton(
                icon: Icon(
                    prod.isFavourite ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  prod.toggleIsFavourite();
                },
                color: Theme.of(context).accentColor,
              );
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addToCart(
                  loadedProduct.id, loadedProduct.title, loadedProduct.price);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
