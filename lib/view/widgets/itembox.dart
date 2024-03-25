import 'package:flutter/material.dart';
import 'package:sellr_app/view/details.dart';

class ImageContainerWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String rate;

  const ImageContainerWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 220,
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetailsPage()));
            },
            child: SizedBox(
              height: 162,
              width: 170,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: Text(rate, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
