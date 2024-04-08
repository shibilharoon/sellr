import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellr_app/controller/firestore_provider.dart';
import 'package:sellr_app/controller/image_provider.dart';
import 'package:sellr_app/model/product_model.dart';
import 'package:sellr_app/view/details.dart';
import 'package:sellr_app/view/notification.dart';
import 'package:sellr_app/view/widgets/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 50, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sellr",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const NotificationPage())));
                    },
                    child: const Icon(
                      Icons.notifications_sharp,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: const EdgeInsets.all(10),
                    fillColor: const Color.fromARGB(255, 223, 223, 223),
                    filled: true),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryWidget(
                    categoryName: 'Cars',
                    image: "assets/image/car.jpeg",
                  ),
                  CategoryWidget(
                    categoryName: 'Bikes',
                    image: "assets/image/bike.webp",
                  ),
                  CategoryWidget(
                    categoryName: 'Phone',
                    image: "assets/image/phone.jpeg",
                  ),
                  CategoryWidget(
                    categoryName: 'Fridge',
                    image: "assets/image/fridge.webp",
                  ),
                  CategoryWidget(
                    categoryName: 'Mixer',
                    image: "assets/image/mixer.jpg",
                  ),
                ],
              ),
            ),
            Consumer<FirestoreProvider>(
              builder: (context, value, child) => GridView.builder(
                itemCount: value.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final ProductModel product = value.productList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: product),
                        ),
                      ),
                      child: Consumer<ImageProviders>(
                        builder: (context, value, child) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.black12,
                                  child: Image.network(
                                    product.imageUrl ?? "",
                                    height: 120,
                                  ),
                                ),
                                Text(
                                  product.name!,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 6, right: 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹${product.price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
