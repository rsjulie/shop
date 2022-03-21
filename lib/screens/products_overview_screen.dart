import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import '../components/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha loja'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Somente favoritos'),
                value: FilterOptions.Favorite,
              ),
              const PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              )
            ],
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorite) {
                provider.showFavoriteOnly();
              } else {
                provider.showAll();
              }
            },
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
