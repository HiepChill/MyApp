import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const Logo({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200]),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
