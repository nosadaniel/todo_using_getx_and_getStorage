import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/homeScreen.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      title: 'Todo for Geiger',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
