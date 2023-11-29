import 'package:flutter/material.dart';
import 'package:friday_test_241123/controller/add_cart_controller.dart';
import 'package:friday_test_241123/controller/cart_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/item_model.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({
    super.key,
  });

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  var box = Hive.box<itemModel>("New");
  List cartItemKeys = [];
  int value = 0;

  @override
  void initState() {
    cartItemKeys = box.keys.toList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: cartItemKeys.length,
          separatorBuilder: (context, index) => SizedBox(),
          itemBuilder: (context, index) => Container(
            //
            height: 200,
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(box
                              .get(cartItemKeys[index])!
                              .image //box.get(1st key),...goes on
                          ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          "Stylish Frame",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        IconButton(
                          onPressed: () {
                            CartController().incrementQuantity(
                                cartItemKeys[index],
                                box.get(cartItemKeys[index])! //notnull
                                );
                            //value--;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.grey, //
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        box.get(cartItemKeys[index])!.quantity >= 1
                            ? Text(box
                                .get(cartItemKeys[index])!
                                .quantity
                                .toString())
                            : Text(1.toString()), //////////
                        SizedBox(
                          width: 2,
                        ),
                        IconButton(
                          onPressed: () {
                            CartController().decrementQuantity(
                                cartItemKeys[index],
                                box.get(cartItemKeys[index])! //notnull
                                );
                            //value--;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.grey, //
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          "${box.get(cartItemKeys[index])!.price}/-",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        IconButton(
                            onPressed: () {
                              CartController().deleteItem(cartItemKeys[index]);
                              cartItemKeys = box.keys.toList();
                              setState(() {});
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
