import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  const SquareTile({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
