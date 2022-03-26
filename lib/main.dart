import 'package:flutter/material.dart';
import 'package:online_shopping_app/model/products.dart';
import 'package:online_shopping_app/screens/product_details_screen.dart';
import 'package:online_shopping_app/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Products(),
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
          "/": (ctx) => ProductOverviewScreen(),
          ProductDetails.routeName: (ctx) => ProductDetails(),
        },
      ),
    );
  }
}
