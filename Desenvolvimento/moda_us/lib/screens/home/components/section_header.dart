import 'package:flutter/material.dart';
import 'package:moda_us/models/section.dart';

class SectionHeader extends StatelessWidget {

  const SectionHeader(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        section.name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 20,
        )
      ),
    );
  }
}