import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({required this.icons, required this.hintText,required this.controller, super.key});
  final String hintText;
  final IconData icons;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: Icon(icons),
          hintText: hintText,
          fillColor: const Color(0xFFF7F8F9),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
    );
  }
}
