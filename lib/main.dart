import 'package:flutter/material.dart';
import 'package:todoapp/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Todo(),
      ),
      
    );
  }
}