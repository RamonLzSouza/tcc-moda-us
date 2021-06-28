import 'package:flutter/material.dart';
import 'package:moda_us/common/custom_drawer/custom_drawer.dart';
import 'package:moda_us/models/product_manager.dart';
import 'package:moda_us/screens/products/components/product_list_tile.dart';
import 'package:provider/provider.dart';

import 'components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Consumer<ProductManager>(
          builder: (_, productManager, __){
            if(productManager.search.isEmpty){
              return const Text('Produtos');
            } else{
              return LayoutBuilder(builder: (_, constraints){
                  return GestureDetector(
                  onTap: () async {
                    final search = await showDialog<String>(context: context, 
                        builder: (_) => SearchDialog(
                          productManager.search
                        ));
                      if (search != null){
                        productManager.search = search;
                      }
                  },
                  child: Container(
                    width: constraints.biggest.width,
                    child: Text(
                      productManager.search,
                      textAlign: TextAlign.center,
                      ),
                  ),
                 );
                }
              );
            }
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          Consumer<ProductManager>(
            builder: (_, productManager, __){
              if(productManager.search.isEmpty){
                return IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(context: context, 
                      builder: (_) => SearchDialog(
                        productManager.search
                      ));
                    if (search != null){
                      productManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () async {
                      productManager.search = '';
                    }
                );
              }
            },
          )
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          final filteredProducts = productManager.filteredProducts;
          return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: filteredProducts.length,
              itemBuilder: (_, index) {
                return ProductListTile(filteredProducts[index]);
              });
        },
      ),
    );
  }
}
