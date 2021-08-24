import 'package:flutter/material.dart';
import 'package:moda_us/models/product_manager.dart';
import 'package:moda_us/models/section_item.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemTile extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ItemTile(this.item);

  final SectionItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.product != null) {
          final product =
              context.read<ProductManager>().findProductById(item.product);
          if (product != null) {
            Navigator.of(context).pushNamed('/product', arguments: product);
          }
        }
      },
      child: AspectRatio(
        aspectRatio: 0.55,
        child:
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage, 
              image: item.image,
              fit: BoxFit.cover,
            ),
      ),
    );
  }
}
