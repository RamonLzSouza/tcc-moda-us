import 'package:moda_us/models/cart_produtct.dart';
import 'package:moda_us/models/product.dart';

class CartManager{

  List<CartProduct> items = [];

  void addToCart(Product product){
    items.add(CartProduct.fromProduct(product));
  }
    
}