import 'package:flutter/material.dart';

import 'office_itemlist.dart';
import 'office_itemlist1.dart';

class Office extends StatefulWidget {
  const Office({Key? key}) : super(key: key);
  @override
  State<Office> createState() => _OfficeState();
}

class _OfficeState extends State<Office> {
  List<Widget> roomClasses = [Office_Itemlist(), Office_Itemlist_()];
  List<String> roomImages = ['assets/workplace.jpg', 'assets/godown.jpg'];
  List<String> rooms = ['Workplace', 'Godown'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/office.jpg'),
                opacity: 0.5,
                fit: BoxFit.cover,
              ),
            ),
            child: GridView.builder(
              itemCount: rooms.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 111,
                mainAxisSpacing: 1,
                childAspectRatio: 1 / 1.1,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => roomClasses[index]));
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 300,
                            width: 180,
                            child: Image.asset(
                              roomImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          rooms[index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
