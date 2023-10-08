import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/first.dart';

class AuthService {
  // login
  // Future<User?> Login(
  //     String email, String password, BuildContext context) async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);
  //     return userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(e.message.toString()),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  //   return null;
  // }

  // VerifyUser(){
  //   if()
  // }

  // signup
  Future<User?> SignUp(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  signout() {
    FirebaseAuth.instance.signOut();
  }
}
