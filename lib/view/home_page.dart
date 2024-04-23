import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellr_app/controller/auth_provider.dart';
import 'package:sellr_app/controller/firestore_provider.dart';
import 'package:sellr_app/controller/image_provider.dart';
import 'package:sellr_app/model/product_model.dart';
import 'package:sellr_app/view/details.dart';
import 'package:sellr_app/view/notification.dart';
import 'package:sellr_app/view/search_page.dart';
import 'package:sellr_app/view/settings.dart';
import 'package:sellr_app/view/widgets/headingtext.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 65, 58),
        elevation: 0,
        title: Row(
          children: [
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              'Sellr',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const NotificationPage())));
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    '3', // Assuming there are 3 notifications
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              // Add action for another icon if needed
            },
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
              },
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ));
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            HeadingText(heading: 'Category'),
            const SizedBox(height: 10),
            Consumer<FirestoreProvider>(
              builder: (context, value, child) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: value.categoryList.map((category) {
                    final isSelected = value.selectedCategory == category;
                    return GestureDetector(
                      onTap: () {
                        value.fetchProductsByCategory(category: category);
                        value.selectedCategory = category;
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color.fromARGB(255, 5, 65, 58)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: isSelected
                              ? Border.all(
                                  color: Color.fromARGB(255, 5, 65, 58))
                              : null,
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            HeadingText(heading: 'Recommendations'),
            const SizedBox(height: 10),
            Consumer<FirestoreProvider>(
              builder: (context, value, child) => GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: value.productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final ProductModel product = value.productList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsPage(products: product),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 5, 65, 58),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color.fromARGB(255, 5, 65, 58).withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.network(
                              product.imageUrl!,
                              width: double.infinity,
                              height: screenHeight * 0.2,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '₹${product.price}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
