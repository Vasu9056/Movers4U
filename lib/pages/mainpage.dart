import 'package:demo/auth/loginpage.dart';
import 'package:demo/pages/first.dart';
import 'package:flutter/material.dart';

import '../auth/authservice.dart';
import 'map.dart';
import 'movehome.dart';
import 'office.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Packers & Movers"),
        actions: [
          IconButton(
              onPressed: () {
                AuthService().signout();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const MyHomePage())));
              },
              icon: Icon(Icons.logout)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const Maps())));
              },
              icon: Icon(Icons.location_on))
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/choice.jpg',
            ),
            opacity: 0.46,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: 300,
                height: 50,
                child: Center(
                  child: Text(
                    "Choose whether : ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: TextButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoveHome()));
                        }),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: Center(
                          child: Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Container(
                      child: TextButton(
                          onPressed: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Office()));
                          }),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: Center(
                            child: Text(
                              "Office",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
