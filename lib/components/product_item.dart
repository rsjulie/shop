import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
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
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: const Text(
                          'Tem certeza?',
                        ),
                        content: const Text(
                            'Quer remover o item da lista de produtos?'),
                        actions: [
                          TextButton(
                              child: const Text('Não'),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              }),
                          TextButton(
                              child: const Text('Sim'),
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              }),
                        ],
                      )).then((value) async {
                if (value ?? false) {
                  try {
                    await Provider.of<ProductList>(
                      context,
                      listen: false,
                    ).removeProduct(product);
                  } catch (error) {
                    msg.showSnackBar(
                      SnackBar(
                        content: Text(
                          error.toString(),
                        ),
                      ),
                    );
                  }
                }
              });
            },
          ),
        ]),
      ),
    );
  }
}
