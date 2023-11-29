import 'package:flutter/material.dart';
import 'package:friday_test_241123/cart_page.dart';
import 'package:friday_test_241123/model/item_model.dart';

import 'package:friday_test_241123/view/collection_screen/collection_screen.dart';
import 'package:friday_test_241123/view/featured_screen/featured_screen.dart';
import 'package:friday_test_241123/view/trending_screen/trending_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box<itemModel>("New");

  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          title: Text(
            "Decoration",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cartpage(),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  "Featured",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "Collection",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "Trending",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FeaturedScreen(),
            CollectionScreen(),
            TrendingScreen(),
          ],
        ),
      ),
    );
  }
}


// body: Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Column(
//     children: [
//       SizedBox(
//         height: 40,
//       ),
//       Row(
//         children: [
//           Text(
//             "Featured",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 25,
//             ),
//           ),
//           SizedBox(
//             width: 30,
//           ),
//           Text(
//             "Collection",
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25,
//                 color: Colors.grey),
//           ),
//           SizedBox(
//             width: 30,
//           ),
//           Text(
//             "Trending",
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25,
//                 color: Colors.grey),
//           ),
//         ],
//       ),
//       SizedBox(
//         height: 30,
//       ),

//     ],
//   ),
// ),
