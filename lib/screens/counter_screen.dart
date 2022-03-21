import 'package:flutter/material.dart';
import 'package:shop/providers/counter.dart';
import '../models/product.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Column(
        children: [
          Text(provider?.state.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              setState(() {
                provider?.state.increment();
              });
              print(provider?.state.value.toString());
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                provider?.state.decrement();
              });
              print(provider?.state.value.toString());
            },
            icon: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
