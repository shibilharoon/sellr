import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellr_app/controller/firestore_provider.dart';
import 'package:sellr_app/model/product_model.dart';
import 'package:sellr_app/view/details.dart';

class FavoriteItemListPage extends StatefulWidget {
  const FavoriteItemListPage({super.key});

  @override
  State<FavoriteItemListPage> createState() => _FavoriteItemListPageState();
}

class _FavoriteItemListPageState extends State<FavoriteItemListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false)
        .fetchFavouriteItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite Items',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FirestoreProvider>(builder: (context, value, child) {
        if (value.favourites.isNotEmpty) {
          print("number  ${value.favourites.length}");
          return ListView.builder(
            itemCount: value.favourites.length,
            itemBuilder: (context, index) {
              final ProductModel product = value.favourites[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          products: product,
                        ),
                      ));
                },
                child: Card(
                  color: Color.fromARGB(255, 60, 27, 14),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product.imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "₹ ${product.price}",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 207, 198, 198),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.location!,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 207, 198, 198),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            value.deleteFavourites(productname: product.name!);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Item $index deleted'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: Text("No Favourite Items"),
          );
        }
      }),
    );
  }
}
