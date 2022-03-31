import 'package:flutter/material.dart';
import 'package:online_shopping_app/widgets/badge.dart';
import 'package:online_shopping_app/widgets/product_grid.dart';

enum FilterOptions { Favourites, All }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Venue'),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favourites) {
                    _showFavourites = true;
                  } else {
                    _showFavourites = false;
                  }
                });
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: FilterOptions.Favourites,
                      child: Text("Show Favourites"),
                    ),
                    const PopupMenuItem(
                      value: FilterOptions.All,
                      child: Text("Show All"),
                    ),
                  ]),
          Badge(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            value: "0",
            color: Colors.red,
          ),
        ],
      ),
      body: ProductGrid(_showFavourites),
    );
  }
}
