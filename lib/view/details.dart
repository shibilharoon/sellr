import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sellr_app/model/product_model.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({super.key, this.product});
  ProductModel? product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  Color iconColor = Colors.black;

  void changeIconColor() {
    setState(() {
      iconColor = iconColor == Colors.black ? Colors.red : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 250,
              child: PageView(
                children: [
                  Image.network(widget.product!.imageUrl ?? ""),
                  // Image.asset('assets/image/bike.webp', fit: BoxFit.cover),
                  // Image.asset('assets/image/bike.webp', fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product!.name ?? "",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      changeIconColor();
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: iconColor,
                    ))
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.product!.location ?? "",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Text(
              'Posted on: January 1, 2024',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product!.price ?? "",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement buy now functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Implement chat functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 16, 100, 19),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text(
                  'Chat',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'More Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.product!.details ?? "",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/image/dp.jpeg'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 20),
            // const Text(
            //   'Location Map',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 10),
            // Container(
            //   height: 200,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.5),
            //         spreadRadius: 2,
            //         blurRadius: 5,
            //         offset: const Offset(0, 3),
            //       ),
            //     ],
            //   ),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(12),
            //     child: Image.asset(
            //       'assets/map_location.jpg',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
