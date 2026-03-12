import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String? description;

  const DescriptionWidget({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Text(description ?? "",
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w300, color: Colors.brown));
  }
}
