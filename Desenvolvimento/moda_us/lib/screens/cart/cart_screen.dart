import 'package:flutter/material.dart';
import 'package:moda_us/models/cart_manager.dart';
import 'package:moda_us/screens/cart/components/cart_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer<CartManager>(
            builder: (_, cartManager, __){
              return Column(
              children: cartManager.items.map(
                (cartProduct) => CartTile(cartProduct)
              ).toList(),
          );
        }
     )
    );
  }
}