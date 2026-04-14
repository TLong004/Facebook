import 'package:flutter/material.dart';

class DirectTxt extends StatelessWidget {
  final String prompt;
  final String actionText;
  final VoidCallback onTap;
  const DirectTxt({
    super.key,
    required this.prompt,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(prompt, style: TextStyle(color: Colors.grey)),
          GestureDetector(
            onTap: onTap,
            child: Text(
              actionText,
              style: TextStyle(
                color: Color(0xFFFF8C00),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
