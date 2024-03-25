import 'package:flutter/material.dart';
import 'package:sellr_app/view/notification.dart';
import 'package:sellr_app/view/widgets/categories.dart';
import 'package:sellr_app/view/widgets/itembox.dart';

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
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Selling",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImageContainerWidget(
                      imagePath: "assets/image/car.jpeg",
                      name: "Lamborghini urus",
                      rate: "2cr",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ImageContainerWidget(
                        imagePath: "assets/image/bike.webp",
                        name: "Lamborghini urus",
                        rate: "2cr"),
                    SizedBox(
                      width: 10,
                    ),
                    ImageContainerWidget(
                        imagePath: "assets/image/car.jpeg",
                        name: "Lamborghini urus",
                        rate: "2cr"),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New In",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImageContainerWidget(
                        imagePath: "assets/image/car.jpeg",
                        name: "Lamborghini urus",
                        rate: "2cr"),
                    SizedBox(
                      width: 10,
                    ),
                    ImageContainerWidget(
                        imagePath: "assets/image/bike.webp",
                        name: "Lamborghini urus",
                        rate: "2cr"),
                    SizedBox(
                      width: 10,
                    ),
                    ImageContainerWidget(
                        imagePath: "assets/image/car.jpeg",
                        name: "Lamborghini urus",
                        rate: "2cr"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
