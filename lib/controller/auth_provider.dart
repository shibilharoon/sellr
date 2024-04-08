import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sellr_app/service/auth_services.dart';

class AuthProviders extends ChangeNotifier {
  Future<UserCredential>? user;
  AuthService service = AuthService();
  signInWithEmail(String email, String password, BuildContext context) {
    return service.signInWithEmailAndPassword(email, password, context);
  }

  signUpWithEmail(String email, String password, String name) {
    return service.signUpWithEmailAndPassword(name, email, password);
  }

  signUpWithGoogle() {
    return service.signInWithGoogle();
  }

 

  signInWithPhone(
      String phonenumber, String name, String email, BuildContext context) {
    try {
      service.signInWithPhone(phonenumber, name, email, context);
    } catch (e) {
      throw Exception(e);
    }
  }

  verifyOtp(String verificationid, String otp, Function onSuccess, String name,
      String email) {
    try {
      service.verifyOtp(
          verificationid: verificationid,
          otp: otp,
          onSuccess: onSuccess,
          email: email,
          name: name);
    } catch (e) {
      throw Exception(e);
    }
  }

  signOut() {
    return service.signout();
  }
}
