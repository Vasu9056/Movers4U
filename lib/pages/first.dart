import 'package:demo/auth/loginpage.dart';
import 'package:demo/auth/signuppage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(children: [
              Image.asset(
                'assets/home-1.jpg',
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => signUpPage())));
                },
                child: Container(
                  width: 165,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    'SignUp',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 38, 25, 25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => LoginPage())));
                },
                child: Container(
                  width: 165,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 38, 25, 25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('ALREADY AN USER? CLICK TO LOGIN',
                  style: TextStyle(fontSize: 15)),
            ]),
          ),
        ),
      ),
    );
  }
}
