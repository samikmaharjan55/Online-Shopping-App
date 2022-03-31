import 'package:flutter/material.dart';
import 'package:online_shopping_app/model/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final String productId;
  final double price;
  final int quantity;

  CartItem(
      {required this.id,
      required this.title,
      required this.productId,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      key: ValueKey(DateTime.now()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeFromCart(productId);
      },
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        padding: EdgeInsets.only(right: 20),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(child: Text("\$ $price")),
              ),
            ),
            title: Text(title),
            subtitle: Text("Total Price: \$${price * quantity}"),
            trailing: Text("$quantity x"),
          ),
        ),
      ),
    );
  }
}
