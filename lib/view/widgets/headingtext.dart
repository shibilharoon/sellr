import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeadingText extends StatelessWidget {
  HeadingText({required this.heading, super.key});
  String heading;
  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}
