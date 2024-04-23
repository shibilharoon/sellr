import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sellr_app/controller/firestore_provider.dart';
import 'package:sellr_app/model/product_model.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({super.key, required this.products});
  ProductModel? products;

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
    final firePro = Provider.of<FirestoreProvider>(context, listen: true);
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
                  Image.network(widget.products!.imageUrl ?? ""),
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
                  widget.products!.name ?? "",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      firePro.addToFavourites(
                          product: widget.products!,
                          productname: widget.products!.name!);
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
              widget.products!.location ?? "",
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
                  "₹ ${widget.products!.price ?? ""}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement buy now functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 96, 154),
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
                  backgroundColor: const Color.fromARGB(255, 5, 65, 58),
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
              widget.products!.details ?? "",
              style: TextStyle(fontSize: 16),
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
