import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sellr_app/model/product_model.dart';
import 'package:sellr_app/model/user_model.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Reference storage = FirebaseStorage.instance.ref();
  String? downloadUrl;

  addProduct(ProductModel product, String name, String uid) async {
    try {
      await firestore.collection("products").doc(name).set(product.toJson());
      await firestore
          .collection("user")
          .doc(auth.currentUser!.uid)
          .collection('product')
          .doc(name)
          .set(product.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  addProductImage({required String productname, required fileimage}) async {
    Reference folder = storage.child('productimage');
    Reference image = folder.child("${productname}.jpg");
    try {
      await image.putFile(fileimage);
      downloadUrl = await image.getDownloadURL();
    } catch (e) {
      throw Exception();
    }
  }

  updateProfileInfo(
      {required String name,
      required String email,
      required String number,
      required String image,
      required String place,
      required String bio}) async {
    try {
      UserModel user = UserModel(
          name: name,
          email: email,
          phonenumber: number,
          image: image,
          place: place,
          bio:bio,
          uid: auth.currentUser!.uid);
      await firestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .update(user.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  addProfileImage({required String username, required fileimage}) async {
    Reference folder = storage.child('profileimage');
    Reference image = folder.child("${username}.jpg");
    try {
      await image.putFile(fileimage);
      downloadUrl = await image.getDownloadURL();
    } catch (e) {
      throw Exception();
    }
  }
}
