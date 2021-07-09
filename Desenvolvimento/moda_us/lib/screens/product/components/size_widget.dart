import 'package:flutter/material.dart';
import 'package:moda_us/models/item_size.dart';
import 'package:moda_us/models/product.dart';
import 'package:provider/provider.dart';

class SizeWidget extends StatelessWidget {
  

  const SizeWidget({this.size});

  final ItemSize size;

  @override
  Widget build(BuildContext context) {
    final product = context.watch<Product>();
    final selected = size == product.selectedSize;

/* height: 5.0,
            width: 5.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/x.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ), */

    Color color;
    if(!size.hasStock) {
      color = Colors.red.withAlpha(25);
    } else if(selected) {
      color = Theme.of(context).primaryColor;

    } else {
      color = Colors.grey.withAlpha(30);
    }

    
    return GestureDetector(
      onTap: (){
        if(size.hasStock){
          product.selectedSize = size;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color
          ),
        ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: !size.hasStock ? Colors.red.withAlpha(25) : Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              size.name,
              style: const TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.bold,
                fontSize: 16
                ),
            ),
          ),
          
              //PREÇO POR TAMANHO
                  //Container(
                  //  padding: const EdgeInsets.symmetric(horizontal: 16),
                  // child: //Text(
                    //  'R\$ ${size.price.toStringAsFixed(2)}',
                  //   style: TextStyle(color: !size.hasStock ? Colors.red.withAlpha(50) : Colors.grey,),
                    //),
                  //),

        ],
      )
      ),
    );
  }
}