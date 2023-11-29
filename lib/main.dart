import 'package:flutter/material.dart';
import 'package:friday_test_241123/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/item_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(itemModelAdapter());
  var box = await Hive.openBox<itemModel>("New");
  runApp(MyCart());
}

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
