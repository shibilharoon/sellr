import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sellr_app/model/chat_model.dart';
import 'package:sellr_app/model/product_model.dart';
import 'package:sellr_app/model/user_model.dart';
import 'package:sellr_app/service/firestore_service.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreService service = FirestoreService();
  List<ProductModel> productList = [];
  List<ProductModel> favourites = [];
  List<String> categoryList = [];
  String? selectedCategory;
  UserModel? currentUser;
  String searchQuery = '';
   List<ChatModel> messages = [];
  ScrollController scrollController = ScrollController();

  fetchCurrentUser() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await service.firestore
          .collection('user')
          .doc(service.auth.currentUser!.uid)
          .get();
      currentUser = UserModel.fromJson(snapshot.data()!);
      print("name ${currentUser!.name}");
      notifyListeners();
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

  addProduct(
      {required ProductModel product,
      required String name,
      required String uid}) {
    return service.addProduct(product, name, uid);
  }

  addProductImage({required String productname, required fileimage}) {
    return service.addProductImage(
        productname: productname, fileimage: fileimage);
  }

  updateUserInfo({
    required String name,
    required String email,
    required String number,
    required String image,
    required String place,
    required String bio,
  }) {
    return service.updateProfileInfo(
        name: name,
        email: email,
        number: number,
        image: image,
        place: place,
        bio: bio);
  }

  addProfileImage({required String username, required fileimage}) {
    return service.addProfileImage(username: username, fileimage: fileimage);
  }

  addToFavourites({required ProductModel product, required String productname}) {
    return service.addToFavourites(product, productname);
  }

  List<ProductModel> fetchFavouriteItems() {
    try {
      service.firestore
          .collection('user')
          .doc(service.auth.currentUser!.uid)
          .collection('favourites')
          .snapshots()
          .listen((favouriteitems) {
        favourites = favouriteitems.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList();
        notifyListeners();
      });
      return favourites;
    } catch (e) {
      throw Exception();
    }
  }

  deleteFavourites({required String productname}) {
    return service.deleteFavouriteItems(productname);
  }

    List<ChatModel> getMessages(String currentUserId, String recieverId) {
    List ids = [currentUserId, recieverId];
    ids.sort();
    String chatroomid = ids.join('_');
    service.firestore
        .collection('chats')
        .doc(chatroomid)
        .collection('message')
        .orderBy("time", descending: false)
        .snapshots()
        .listen((message) {
      messages =
          message.docs.map((doc) => ChatModel.toJson(doc.data())).toList();
      notifyListeners();
      scrollDown();
    });
    return messages;
  }

  void scrollDown() => WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });
}
