import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}