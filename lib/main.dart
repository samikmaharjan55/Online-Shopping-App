import 'package:flutter/material.dart';
import 'package:online_shopping_app/model/cart_provider.dart';
import 'package:online_shopping_app/model/products.dart';
import 'package:online_shopping_app/screens/cart_screen.dart';
import 'package:online_shopping_app/screens/product_details_screen.dart';
import 'package:online_shopping_app/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop Venue',
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
          accentColor: Colors.red,
          fontFamily: "Lato",
        ),
        initialRoute: "/",
        routes: {
          "/": (ctx) => const ProductOverviewScreen(),
          ProductDetails.routeName: (ctx) => const ProductDetails(),
          CartScreen.routeName: (ctx) => const CartScreen(),
        },
      ),
    );
  }
}
