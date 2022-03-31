import 'package:flutter/material.dart';
import 'package:online_shopping_app/model/cart_provider.dart' show Cart;
import 'package:online_shopping_app/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      "\$${cart.totalAmount}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text(
                      "ORDER NOW",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (context, i) => CartItem(
                      id: cart.items.values.toList()[i].id,
                      title: cart.items.values.toList()[i].title,
                      productId: cart.items.keys.toList()[i],
                      price: cart.items.values.toList()[i].price,
                      quantity: cart.items.values.toList()[i].quantity,
                    )),
          )
        ],
      ),
    );
  }
}
