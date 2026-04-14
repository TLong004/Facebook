import 'package:flutter/material.dart';

class OrangeBlob extends StatelessWidget {
  final double top;
  final double right;

  const OrangeBlob({super.key, this.top = -30, this.right = -30});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: Container(
        width: 180,
        height: 180,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFB347), Color(0xFFFF8C00)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(60),
          ),
        ),
      ),
    );
  }
}