import 'package:flutter/material.dart';
import 'package:demo/pages/mainpage.dart';

import 'authservice.dart';
class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}
class _signUpPageState extends State<signUpPage> {
  final _formkey = GlobalKey<FormState>();
  String name = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
  String passwd = '';
  String checkpasswd = '';

  void _submitForm() {
    final isValid = _formkey.currentState!.validate();
    if (isValid && checkpasswd == passwd) {
      // do something with form data
      AuthService().SignUp(email, passwd, context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: ((context) => const MainPage())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/signup.jpg'),
                    opacity: 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Text(
                          "Welcome $firstName",
                          style: TextStyle(
                            color: Color.fromARGB(255, 44, 14, 72),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your First Name",
                                  labelText: "First Name",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "First Name can't be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  firstName = value;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your Last Name",
                                  labelText: "Last Name",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Last Name can't be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  lastName = value;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your E-mail ID",
                                  labelText: "Mail Address",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email-Id can't be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  email = value;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter 10 digit Number",
                                  labelText: "Phone number",
                                ),
                                validator: (value) {
                                  if (value != null && value.length > 10) {
                                    return "Number should be maximum 10 digit";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  phoneNumber = value;
                                },
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your Password",
                                  labelText: "Password",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password can't be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  passwd = value;
                                },
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Reenter your Password",
                                  labelText: "Password",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password can't match";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  checkpasswd = value;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: _submitForm,
                          child: Container(
                            width: 165,
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 20, 58, 21),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 180,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => MainPage())));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                                color: Colors.black,
                              ),
                              Text("Back"),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }
}
