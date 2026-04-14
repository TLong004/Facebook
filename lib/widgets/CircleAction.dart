import 'package:flutter/material.dart';

class CircleAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  double iconSize;
  Color iconColor; 

  CircleAction({super.key, required this.icon, required this.onPressed, this.iconSize = 20, this.iconColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed, 
        icon: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        constraints: const BoxConstraints(),
      ),
    );
  }
}