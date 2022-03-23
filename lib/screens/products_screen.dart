import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/models/product_list.dart';

class ProducstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Gerenciar produtos')),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: products.itemsCount,
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  ProductItem(
                    product: products.items[i],
                  ),
                  Divider()
                ],
              );
            }),
      ),
    );
  }
}