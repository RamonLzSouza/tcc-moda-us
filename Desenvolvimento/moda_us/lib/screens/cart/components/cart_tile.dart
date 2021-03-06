import 'package:flutter/material.dart';
import 'package:moda_us/common/custom_icon_button.dart';
import 'package:moda_us/models/cart_product.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {


  const CartTile(this.cartProduct);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cartProduct,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(cartProduct.product.images.first),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cartProduct.product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Tamanho: ${cartProduct.size}',
                          style: const TextStyle(fontWeight: FontWeight.w300),
    
                        )
                      ),
                      Consumer<CartProduct>(
                        builder: (_, cartProdut, __){
                          if(cartProduct.hasStock) {
                            return Text(
                            'R\$ ${cartProduct.unitPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          );
                          } else {
                            return const Text(
                              'Sem estoque suficiente para a quantidade selecionada',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize:12
                              ),
                            );
                          }
                        },
                      )
                    ],
                  )
                )
                ),
               Consumer<CartProduct>(
                 builder: (_, cartProduct, __){
                   return Column(
                      children: <Widget>[
                        CustomIconButton(
                          iconData: Icons.add,
                          color: Theme.of(context).primaryColor,
                          onTap: cartProduct.increment,
                        ),
                        Text(
                          '${cartProduct.quantity}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        CustomIconButton(
                          iconData: Icons.remove,
                          color: cartProduct.quantity > 1 ? 
                            Theme.of(context).primaryColor : Colors.grey,
                          onTap: cartProduct.decrement,
                        ),
                      ]
                    );
                 },
               )
    
            ],
          )
        )
        
      ),
    );
  }
}