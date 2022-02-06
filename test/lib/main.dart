import 'package:flutter/material.dart';
import 'package:test/widgets/scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Aplikacja samochodowa'),
      debugShowCheckedModeBanner: false,
    );
  }
}