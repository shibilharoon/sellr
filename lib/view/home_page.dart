import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sellr_app/controller/auth_provider.dart';
import 'package:sellr_app/controller/firestore_provider.dart';
import 'package:sellr_app/controller/image_provider.dart';
import 'package:sellr_app/model/product_model.dart';
import 'package:sellr_app/view/details.dart';
import 'package:sellr_app/view/notification.dart';
import 'package:sellr_app/view/search_page.dart';
import 'package:sellr_app/view/widgets/headingtext.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    pro.fetchCurrentUser();
    pro.fetchProducts();
    pro.fetchAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 223, 223),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sellr",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) =>
                                    const NotificationPage())));
                          },
                          child: const Icon(
                            Icons.notifications_sharp,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10),
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //         prefixIcon: const Icon(Icons.search),
                    //         hintText: "Search",
                    //         border: OutlineInputBorder(
                    //             borderSide: BorderSide.none,
                    //             borderRadius: BorderRadius.circular(20)),
                    //         contentPadding: const EdgeInsets.all(10),
                    //         fillColor: Color.fromARGB(255, 255, 255, 255),
                    //         filled: true),
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: HeadingText(heading: "Category"),
          ),
          SizedBox(
            height: screenHeight * 0.08,
            child: Consumer<FirestoreProvider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: value.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final String category = value.categoryList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: GestureDetector(
                      onTap: () {
                        value.fetchProductsByCategory(category: category);
                        value.selectedCategory = category;
                      },
                      child: Container(
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.05,
                        decoration: BoxDecoration(
                          border: value.selectedCategory == category
                              ? Border.all(
                                  color: Color.fromARGB(255, 225, 223, 223))
                              : Border.all(color: Colors.transparent),
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            // style: GoogleFonts.urbanist(
                            //   fontSize: 15,
                            //   fontWeight: FontWeight.bold,
                            //   color: Colors.white,
                            // ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: HeadingText(heading: "Recommentations"),
          ),
          Expanded(
            child: Consumer<FirestoreProvider>(
              builder: (context, value, child) => GridView.builder(
                itemCount: value.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final ProductModel product = value.productList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
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
                                    product.imageUrl!,
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
          ),
        ],
      ),
    );
  }
}
