import 'package:flutter/material.dart';
import 'package:moda_us/models/product.dart';
import 'package:moda_us/screens/edit_product/components/images_form.dart';

class EditProductScreen extends StatelessWidget {

  const EditProductScreen(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Anúncio'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ImagesForm(),
          TextFormField(
            initialValue: "Banana",
          )
        ],
      )
    );
  }
}