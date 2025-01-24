// ignore_for_file: unused_import

import 'package:bagong/login/login.dart';
import 'package:bagong/mainpage/mainpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter latihan login';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MainPage(),
    );
  }
}
