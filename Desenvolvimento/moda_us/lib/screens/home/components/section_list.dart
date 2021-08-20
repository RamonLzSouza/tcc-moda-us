import 'package:flutter/material.dart';
import 'package:moda_us/models/section.dart';
import 'package:moda_us/screens/home/components/item_tile.dart';
import 'package:moda_us/screens/home/components/section_header.dart';

class SectionList extends StatelessWidget {

  const SectionList(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(section),
          SizedBox(
            height: 250,
            child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index){
                    return ItemTile(section.items[index]);
                  }, 
                  separatorBuilder: (_, __) => const SizedBox(width: 10,), 
                  itemCount: section.items.length,
                  ),
          )
        ],
      )
    );
  }
}