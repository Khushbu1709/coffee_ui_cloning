import 'package:coffee_ui_cloning/home/coffee_tiles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Coffename> coffeeType1 = [
    Coffename(name: 'cuppucino'),
    Coffename(name: 'Latte'),
    Coffename(name: 'Black'),
    Coffename(name: 'Tea'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Icon(Icons.person),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "Find The Best Coffee For You",
              style: GoogleFonts.bebasNeue(fontSize: 40),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Find Your Coffee...",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: coffeeType1.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      for (int i = 0; i < coffeeType1.length; i++) {
                        coffeeType1[i].isSelected =
                            coffeeType1[index].isSelected;
                      }
                      coffeeType1[index].isSelected =
                          !coffeeType1[index].isSelected;
                      debugPrint("dsfdsf${coffeeType1[index].isSelected}");
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      child: Text(
                        coffeeType1[index].name ?? '',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: coffeeType1[index].isSelected
                                ? Colors.orange
                                : Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(),
                CoffeeTile(),
                CoffeeTile(),
                CoffeeTile(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Coffename {
  String? name;
  bool isSelected;

  Coffename({this.name, this.isSelected = false});
}
