import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sellr_app/controller/firestore_provider.dart';
import 'package:sellr_app/controller/image_provider.dart';
import 'package:sellr_app/model/product_model.dart';
import 'package:sellr_app/view/bottombar.dart';

class ProductAddingPage extends StatefulWidget {
  const ProductAddingPage({
    super.key,
  });

  @override
  _ProductAddingPageState createState() => _ProductAddingPageState();
}

class _ProductAddingPageState extends State<ProductAddingPage> {
  TextEditingController imageController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<ImageProviders>(
              builder: (context, value, child) => Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      value.selectImage(source: ImageSource.camera);
                    },
                    child: Container(
                      height: 150,
                      width: 330,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: value.selectedImage != null
                                  ? FileImage(File(value.selectedImage!.path))
                                  : const AssetImage(
                                          "assets/image/add image png.png")
                                      as ImageProvider),
                          color: const Color.fromARGB(255, 178, 103, 24),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(Icons.add),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.shopping_bag),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.category),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: rateController,
              decoration: InputDecoration(
                labelText: 'Rate',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.description),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addProduct(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 178, 103, 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Add Product',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addProduct(BuildContext context) {
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    final uid = pro.service.auth.currentUser!.uid;
    ProductModel product = ProductModel(
        name: productNameController.text,
        price: rateController.text,
        category: categoryController.text,
        details: descriptionController.text,
        imageUrl: imageController.text,
        location: locationController.text);
    pro.addProduct(
        product: product, name: productNameController.text, uid: uid);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBar(),
        ));
  }
}
