import 'package:flutter/material.dart';
import 'package:flutterexamples/admin_pro/material_admin_pro_page.dart';
import 'package:flutterexamples/layouts/layouts.dart';
import 'package:flutterexamples/menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuPage(),
      // home: AdminProPage(),
    );
  }
}
