import 'package:flutter/material.dart';
import 'package:demo/pages/takephoto.dart';

import 'itemlist.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<String> furniture = ['Chair', 'Table', 'Sofa', 'TV'];
  List<IconData> icons = [
    Icons.chair,
    Icons.table_bar,
    Icons.bed,
    Icons.tv,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Others"),
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
                  width: 340,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/o-1.jpg'),
                          fit: BoxFit.fill)),
                ),
                GridView.builder(
                  itemCount: furniture.length,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      mainAxisExtent: 120),
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
