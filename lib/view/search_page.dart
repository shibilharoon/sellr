import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sellr_app/controller/firestore_provider.dart';
import 'package:sellr_app/model/product_model.dart';
import 'package:sellr_app/view/details.dart';
import 'package:sellr_app/view/notification.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 223, 223),
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 25),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back)),
                        const Text(
                          "Sellr",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: 240,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Consumer<FirestoreProvider>(
                      builder: (context, pro, child) => TextFormField(
                        onChanged: (value) {
                          pro.searchProducts(value);
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)),
                            contentPadding: const EdgeInsets.all(10),
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            filled: true),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer<FirestoreProvider>(
            builder: (context, value, child) => SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
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
                      child: Container(
                        width: size.width / 2,
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.55,
                                height: size.height * 0.15,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Hero(
                                  tag: product.name!,
                                  child: Image.network(product.imageUrl!),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                  product.name!,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${product.name}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: value.productList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
