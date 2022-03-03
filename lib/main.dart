import 'package:farm/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: wrapper(),
      theme: ThemeData(fontFamily: "Circular"),
      debugShowCheckedModeBanner: false,
    );
  }
}

