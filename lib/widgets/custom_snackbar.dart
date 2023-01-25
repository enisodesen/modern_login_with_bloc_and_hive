// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  @override
  final Widget content;

  const CustomSnackBar({
    Key? key,
    required this.content,
  }) : super(key: key, content: content);

  Widget build(BuildContext context) {
    return SnackBar(
        content: content,
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.yellow.shade200);
  }
}
