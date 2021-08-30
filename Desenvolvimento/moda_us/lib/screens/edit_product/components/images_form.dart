import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:moda_us/models/product.dart';

class ImagesForm extends StatelessWidget {
  const ImagesForm(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return FormField<List<dynamic>>(
      initialValue: product.images,
      builder: (state) {
        return Container(
          height: 500,
          width: 500,
          child: AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              images: state.value.map((image) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    if(image is String)
                      Image.network(image, fit: BoxFit.cover,)
                    else
                      Image.file(image as File, fit: BoxFit.cover,),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.remove),
                        color: Colors.red,
                        onPressed: (){
                          state.value.remove(image);
                          state.didChange(state.value);
        
                        },
                      )
                    )
                  ],
                );
              }).toList(),
              dotSize: 5,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              dotColor: Theme.of(context).primaryColor,
              autoplay: false,
            ),
          ),
        );
      },
    );
  }
}
