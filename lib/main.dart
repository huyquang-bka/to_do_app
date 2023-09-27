import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_page.dart';

void main() async {
  //init the Hive
  await Hive.initFlutter();
  //open the box
  await Hive.openBox("todo_db");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Todo App'),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
