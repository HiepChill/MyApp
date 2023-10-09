import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  final controller;
  final String? hintText;
  final bool obscureText;
  final Icon prefixIcon;

  const MyTextFeild(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            focusColor: Colors.transparent,
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
