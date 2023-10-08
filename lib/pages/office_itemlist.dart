import 'package:flutter/material.dart';

import 'movefromto.dart';

class Office_Itemlist extends StatefulWidget {
  Office_Itemlist({super.key});

  @override
  State<Office_Itemlist> createState() => _Office_ItemlistState();
}
class _Office_ItemlistState extends State<Office_Itemlist> {
  final Map<String, int> itemCounts = {};

  @override
  void initState() {
    super.initState();

    // Initialize the item counts to 0
    for (String item in furniture) {
      itemCounts[item] = 0;
    }
  }

  bool get hasSelectedItem {
    for (String item in furniture) {
      if (itemCounts[item]! > 0) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose from the list of items"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: furniture.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    color: Colors.grey[600],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            furniture[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                itemCounts[furniture[index]] =
                                    itemCounts[furniture[index]]! + 1;
                              });
                            },
                            icon: const Icon(Icons.add_circle),
                          ),
                          Text(
                            itemCounts[furniture[index]]!.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (itemCounts[furniture[index]]! > 0) {
                                  itemCounts[furniture[index]] =
                                      itemCounts[furniture[index]]! - 1;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove_circle),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                padding: EdgeInsets.all(10),
              ),
            ),
            ElevatedButton(
              onPressed: hasSelectedItem
                  ? () {
                      // Get the selected items and their counts
                      Map<String, int> selectedItems = {};
                      furniture.forEach((item) {
                        if (itemCounts[item]! > 0) {
                          selectedItems[item] = itemCounts[item]!;
                        }
                      });

                      // Navigate to the next page and pass the selected items
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EnterAddressPage1(
                          selectedItems: selectedItems,
                        ),
                      ));
                    }
                  : null,
              child: Text("Next"),
            ),
            if (!hasSelectedItem)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Please select at least one item",
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<String> furniture = [
    'Desks',
    'chairs',
    'projectors',
    'Decor-Big',
    'Decor-small',
    'Frames',
    'Computers',
    'Library',
    'Refrigerator',
    'Other'
  ];
}

class EnterAddressPage1 extends StatelessWidget {
  final Map<String, int> selectedItems;

  const EnterAddressPage1({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Items"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: selectedItems.entries
              .map((entry) => ListTile(
                    title: Text(entry.key),
                    trailing: Text(entry.value.toString()),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => EnterAddressPage())));
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
