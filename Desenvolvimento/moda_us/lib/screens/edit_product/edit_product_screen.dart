import 'package:flutter/material.dart';
import 'package:moda_us/models/product.dart';
import 'package:moda_us/screens/edit_product/components/images_form.dart';

class EditProductScreen extends StatelessWidget {

  EditProductScreen(this.product);

  final Product product;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Anúncio'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            ImagesForm(product),
            RaisedButton(
              onPressed: (){
                  if(formKey.currentState.validate()){
                    print('válido!!!');
                  } else{
                    print('invalido!!!');
                  }
              },
              child: const Text('Salvar'),
              ),
          ],
        ),
      )
    );
  }
}