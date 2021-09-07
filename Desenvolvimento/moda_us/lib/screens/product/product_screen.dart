import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:moda_us/models/cart_manager.dart';
import 'package:moda_us/models/product.dart';
import 'package:moda_us/models/user_manager.dart';
import 'package:moda_us/screens/product/components/size_widget.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {

  const ProductScreen(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return ChangeNotifierProvider.value(
      value: product,
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.name),
          centerTitle: true,
          actions: <Widget>[
            Consumer<UserManager>(
              builder: (_, userManager, __){
                if(userManager.adminEnabled){
                  return IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed(
                        '/edit_product',
                        arguments: product
                        );

                    },
                  );
                } else{
                  return Container();
                }
              }
            ,)
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          
          children: <Widget>[
            Container(
              height: 500,
              width: 500,
              child: AspectRatio(
                aspectRatio: 1,
                child: Carousel(
                  images: product.images.map((url){
                    return NetworkImage(url);
                  }).toList(),
                  dotSize: 5,
                  dotSpacing: 15,
                  dotBgColor: Colors.transparent,
                  dotColor: primaryColor,
                  autoplay: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'A partir de',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'R\$ ${product.basePrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const Padding(
                    
                      padding: EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Tamanhos',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                            
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: product.sizes.map((s){
                        return SizeWidget(size: s);
                      }).toList(),
                    ),
                    const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16
                    ),
                  ),
                    const SizedBox(height: 20,),                    
                      Consumer2<UserManager, Product>(
                        builder: (_, userManager, product, __){
                          if(product.hasStock) {
                            return SizedBox(
                              height: 44,
                              child: RaisedButton(
                                onPressed: product.selectedSize != null ? (){
                                  if(userManager.isLoggedIn){
                                    context.read<CartManager>().addToCart(product);
                                    Navigator.of(context).pushNamed('/cart');
                                  } else{
                                    Navigator.of(context).pushNamed('/login');
                                  }
                                } : null,
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text(
                                  userManager.isLoggedIn
                                    ? 'Adicionar ao Carrinho' 
                                    : 'Entre para Comprar',
                                    style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox(
                              child: Container(
                                color: Colors.red,
                                  child: const SizedBox(
                                      height: 44,
                                      child: RaisedButton(                         
                                        onPressed: null,
                                        child: Text('Estoque indisponível :(',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:18,
                                            fontWeight: FontWeight.bold
                                          ),
                                      ),
                                    ),
                                  ),
                              ),
                            );
                          }
                        },                        
                      )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}