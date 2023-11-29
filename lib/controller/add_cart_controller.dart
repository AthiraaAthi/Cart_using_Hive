import 'package:flutter/material.dart';
import 'package:friday_test_241123/model/item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddCartController {
  var box = Hive.box<itemModel>("New");
  addToCart(itemModel product, BuildContext context) {
    //function
    box.add(product);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("item added to cart")));
  }
}
