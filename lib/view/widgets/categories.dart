import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final String image;

  const CategoryWidget(
      {Key? key, required this.categoryName, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset(
            image,
            height: 15,
            fit: BoxFit.cover,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Text(
          categoryName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
