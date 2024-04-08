import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sellr_app/model/product_model.dart';
import 'package:sellr_app/model/user_model.dart';
import 'package:sellr_app/service/firestore_service.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreService service = FirestoreService();
  List<ProductModel> productList = [];
  List<ProductModel> favoraits = [];
  List<String> categoryList = [];
  String? selectedCategory;
  UserModel? currentUser;
  String searchQuery = '';

  fetchCurrentUser() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await service.firestore
          .collection('user')
          .doc(service.auth.currentUser!.uid)
          .get();
      currentUser = UserModel.fromJson(snapshot.data()!);
      return currentUser;
    } catch (e) {
      throw Exception(e);
    }
  }

  fetchAllCategory() {
    try {
      service.firestore.collection('products').snapshots().listen((product) {
        categoryList = product.docs
            .map((doc) => ProductModel.fromJson(doc.data()).category!)
            .toSet()
            .toList();
        notifyListeners();
      });
    } catch (e) {
      throw Exception();
    }
  }

  List<ProductModel> fetchProductsByCategory({required String category}) {
    try {
      productList.clear();
      service.firestore
          .collection('products')
          .where('category', isEqualTo: category)
          .snapshots()
          .listen((product) {
        productList = product.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList();
        notifyListeners();
      });
      return productList;
    } catch (e) {
      throw Exception();
    }
  }

  List<ProductModel> fetchProducts() {
    try {
      if (searchQuery.isNotEmpty) {
        service.firestore.collection('products').snapshots().listen((product) {
          productList = product.docs
              .map((doc) => ProductModel.fromJson(doc.data()))
              .where((ProductModel product) => product.name!
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()))
              .toList();
          notifyListeners();
        });
        return productList;
      } else {
        service.firestore.collection('products').snapshots().listen((product) {
          productList = product.docs
              .map((doc) => ProductModel.fromJson(doc.data()))
              .toList();
          notifyListeners();
        });
        return productList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  searchProducts(String query) {
    searchQuery = query;
    fetchProducts();
  }

  updateUserInfo({
    required String name,
    required String email,
    required String number,
    required String image,
  }) {
    return service.updateProfileInfo(
        name: name, email: email, number: number, image: image);
  }

  addProfileImage({required String username, required fileimage}) {
    return service.addProfileImage(username: username, fileimage: fileimage);
  }

  addProduct(
      {required ProductModel product,
      required String name,
      required String uid}) {
    return service.addProduct(product, name, uid);
  }



 
}
