import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final String image;

  const CategoryWidget(
      {super.key, required this.categoryName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            image,
            height: 15,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          categoryName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
