import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  const MyCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: const DecorationImage(
          image: AssetImage('lib/images/avt.jpg'),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.blueAccent, width: 2), 
      ),
    );
  }
}