import 'package:flutter/material.dart';
import 'package:demo/pages/takephoto.dart';

import 'itemlist.dart';

class Bedroom extends StatelessWidget {
  List<String> furniture = ['Sofa', 'Table', 'Bed', 'TV'];
  List<IconData> icons = [
    Icons.chair,
    Icons.table_bar,
    Icons.bed,
    Icons.tv,
  ];
  Bedroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bedroom"),
        actions: [
          IconButton(
            icon: Icon(Icons.camera),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => TakePhoto())));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Form(
            child: Column(
              children: [
                Container(
                  height: 280,
                  width: 330,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Bedroom.webp'),
                          fit: BoxFit.fill)),
                ),
                GridView.builder(
                  itemCount: furniture.length,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 20.0,
                      mainAxisExtent: 110),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          iconSize: 40,
                          color: Colors.black,
                          onPressed: (() {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ItemList()));
                          }),
                          icon: Icon(
                            icons[index],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(furniture[index])
                    ],
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => ItemList())));
                  },
                  child: Container(
                    width: 165,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'Select Item',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 13, 32, 14),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
