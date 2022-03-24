import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                  arguments: product,
                );
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text(
                            'Tem certeza?',
                          ),
                          content:
                              Text('Quer remover o item da lista de produtos?'),
                          actions: [
                            TextButton(
                                child: Text('Não'),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                }),
                            TextButton(
                                child: Text('Sim'),
                                onPressed: () {
                                  Provider.of<ProductList>(
                                    context,
                                    listen: false,
                                  ).removeProduct(product);
                                  Navigator.of(context).pop(true);
                                }),
                          ],
                        ));
              },
              icon: Icon(Icons.delete)),
        ]),
      ),
    );
  }
}
