// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo/auth/signuppage.dart';
import 'package:demo/pages/mainpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  bool passwordVisibilty = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formkey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.5,
                image: AssetImage('assets/login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(26),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 350,
                  ),
                  const Text(
                    "Login",
                    
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 14, 72),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailTextEditingController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter Email",
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return "Please enter correct mail";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _username = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    controller: passwordTextEditingController,
                    obscureText: passwordVisibilty == false ? false : true,
                    decoration: InputDecoration(
                      suffixIcon: passwordVisibilty == false
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisibilty = true;
                                });
                              },
                              icon: Icon(Icons.visibility))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisibilty = false;
                                });
                              },
                              icon: Icon(Icons.visibility_off)),
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      } else if (value.length < 6) {
                        return "Password should be at least 6 characters";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _password = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        _signIn();
                      }
                    },
                    child: Container(
                      width: 165,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 20, 58, 21),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  GestureDetector(
                    onTap: () async {
                      User? user = await loginUsingEmailAndPassword(
                          _username, _password, context);
                      // getData(user);
                      if (user != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
                      }
                      if (user == null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Password Incorrect."),
                              );
                            });
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          "New user?",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => signUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void _signIn() async {
    try {
      final User? newUser = (await _firebaseAuth
              .signInWithEmailAndPassword(
                  email: emailTextEditingController.text,
                  password: passwordTextEditingController.text)
              .catchError((errMsg) {
      }))
          .user;

      final isValid = _formkey.currentState!.validate();

      if (newUser != null && isValid)
      //checking in database for user imformation so data cant be overlapped.
      {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Sign in not successful !");
    }
  }

  Future<User?> loginUsingEmailAndPassword(
      String email, String password, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("user-not-found"),
              );
            });
      }
    }
    return user;
  }
}
