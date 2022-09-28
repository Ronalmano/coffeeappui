import 'package:coffeeappui/util/coffee_text.dart';
import 'package:coffeeappui/util/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee type and select status
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff090706),
      appBar: AppBar(
        leading: Container(
            // padding: EdgeInsets.all(0.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: Colors.red,
            ),
            child: const Icon(Icons.grid_view_rounded)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.openSans(
                  fontSize: 36, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeText(
                    coffeetype: coffeeType[index][0],
                    check: coffeeType[index][1],
                    // user taps on coffee type options
                    onTap: () {
                      // Make all selections false
                      for (int i = 0; i < coffeeType.length; i++) {
                        coffeeType[i][1] = false;
                      }
                      setState(() {
                        coffeeType[index][1] = true;
                      });
                    });
              },
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(
                  imagePath:
                      "lib/images/nathan-dumlao-c2Y16tC3yO8-unsplash.jpg",
                  amount: '250',
                  coffeeName: "Cappucino",
                ),
                CoffeeTile(
                  imagePath:
                      "lib/images/nathan-dumlao-tA90pRfL2gM-unsplash.jpg",
                  amount: '350',
                  coffeeName: "Latte",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
