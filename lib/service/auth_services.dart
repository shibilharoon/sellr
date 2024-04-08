import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sellr_app/model/user_model.dart';
import 'package:sellr_app/view/otp.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  signUpWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final UserModel userData =
          UserModel(name: name, email: email, uid: userCredential.user?.uid);
      firestore
          .collection('user')
          .doc(userCredential.user?.uid)
          .set(userData.toJson());
      return userCredential.user;
    } catch (e) {
      print('some error');
    }
  }

  signInWithEmailAndPassword(String email, String password, context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      firestore.collection('user').doc(userCredential.user!.uid).set(
          {'uid': userCredential.user!.uid, 'email': email},
          SetOptions(merge: true));
      return userCredential.user;
    } on FirebaseException catch (e) {
      String errorcode = 'error signIn';
      if (e.code == 'wrong-paswword' || e.code == 'user-not-found') {
        errorcode = "Incorrect email and password";
      } else if (e.code == 'user-disabled') {
        errorcode = 'User Not Found';
      } else {
        errorcode = e.code;
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorcode)));
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gauth = await guser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: gauth.accessToken, idToken: gauth.idToken);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? googleUser = userCredential.user;
      final UserModel userdata = UserModel(
          name: googleUser!.displayName,
          email: googleUser.email,
          uid: googleUser.uid);
      firestore.collection('user').doc(googleUser.uid).set(userdata.toJson());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  signInWithPhone(String phonenumber, String name, String email,
      BuildContext context) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phonenumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {},
          verificationFailed: (FirebaseAuthException error) {
            throw Exception(error.message);
          },
          codeSent: (verificationcode, resendToken) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpPage(
                      verificationid: verificationcode,
                      email: email,
                      name: name),
                ));
          },
          codeAutoRetrievalTimeout: (String codeAutoRetrievalTimeout) {});
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  verifyOtp(
      {required String verificationid,
      required String otp,
      required String name,
      required String email,
      required Function onSuccess}) async {
    try {
      PhoneAuthCredential cred = PhoneAuthProvider.credential(
          verificationId: verificationid, smsCode: otp);
      User? user = (await firebaseAuth.signInWithCredential(cred)).user;

      if (user != null) {
        final UserModel userdata =
            UserModel(email: email, name: name, uid: user.uid);
        firestore.collection('user').doc(user.uid).set(userdata.toJson());
        onSuccess();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  signInWithGithub(context) async {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    try {
      UserCredential user =
          await firebaseAuth.signInWithProvider(githubAuthProvider);
      User gituser = user.user!;
      final UserModel userdata = UserModel(
          email: gituser.email, name: gituser.displayName, uid: gituser.uid);
      firestore.collection("user").doc(gituser.uid).set(userdata.toJson());
      return user;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      throw Exception(e);
    }
  }

  signout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
    } catch (e) {
      print('This is the erro r$e');
    }
  }
}
