import 'package:flutter/material.dart';
import 'package:flutter_mylist/utill/app_colors.dart';
import 'package:flutter_mylist/utill/app_colors.dart';
import 'package:flutter_mylist/view/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() async {
  //init he hive
  await Hive.initFlutter();

//open a box

  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');

  runApp(MyApp());
}

void appColors() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 171, 158, 251),
          primarySwatch: Colors.purple),
    );
  }
}
