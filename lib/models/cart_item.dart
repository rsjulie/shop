import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String product_id;
  final String name;
  final int quantity;
  final double price;

  const CartItem({
    required this.id,
    required this.name,
    required this.product_id,
    required this.quantity,
    required this.price,
  });
}
