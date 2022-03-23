import 'package:flutter/material.dart';
import 'package:online_shopping_app/screens/product_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Venue',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        accentColor: Colors.red,
        fontFamily: "Lato",
      ),
      home: const ProductOverviewScreen(),
    );
  }
}
