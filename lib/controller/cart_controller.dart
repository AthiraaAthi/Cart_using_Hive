import 'package:hive_flutter/hive_flutter.dart';

import '../model/item_model.dart';

class CartController {
  var box = Hive.box<itemModel>("New");
  incrementQuantity(var itemkey, itemModel item) {
    int qty = item.quantity;
    qty++;
    box.put(
      itemkey,
      itemModel(
        title: item.title,
        des: item.des,
        image: item.image,
        price: item.price,
        quantity: qty,
      ),
    );
  }

  decrementQuantity(var itemkey, itemModel item) {
    int qty = item.quantity;
    qty--;
    box.put(
      itemkey,
      itemModel(
        title: item.title,
        des: item.des,
        image: item.image,
        price: item.price,
        quantity: qty,
      ),
    );
  }

  deleteItem(var itemKey) {
    box.delete(itemKey);
  }
}
