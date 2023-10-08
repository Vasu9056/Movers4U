import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bedroom.dart';
import 'kitchen.dart';
import 'livingroom.dart';
import 'others.dart';
class MoveHome extends StatefulWidget {
  const MoveHome({Key? key}) : super(key: key);

  @override
  State<MoveHome> createState() => _MoveHomeState();
}

class _MoveHomeState extends State<MoveHome> {
  List<String> rooms = [
    'Living room',
    'Kitchen',
    'Bed room',
    'Others',
  ];
  List<String> roomImages = [
    'assets/livingroom.jpg',
    'assets/kitchen.jpg',
    'assets/bedroom.jpg',
    'assets/others.jpg',
  ];
  List<Widget> roomClasses = [
    LivingRoom(),
    Kitchen(),
    Bedroom(),
    MyWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Move Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        child: GridView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => roomClasses[index]));
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: SizedBox(
                    height: 252,
                    width: 180,
                    child: Container(
                      child: Image.asset(
                        roomImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  rooms[index],
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1 / 2,
          ),
        ),
      ),
    );
  }
}
