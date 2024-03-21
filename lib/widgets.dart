import 'package:flutter/material.dart';

class ProductivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;
  ProductivityButton({required this.color, required this.text, required this.size, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text(this.text,
        style : TextStyle(
            color: Colors.white),
        ),
        onPressed: onPressed,
        color: color,
        minWidth: size,
    );
  }
}
