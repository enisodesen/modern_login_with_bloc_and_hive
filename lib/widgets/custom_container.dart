import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.color,
    required this.icon,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
            height: 50,
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 70,
                  color: Colors.white,
                ),
                Text(
                  text,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
