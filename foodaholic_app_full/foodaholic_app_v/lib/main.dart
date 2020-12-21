import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/pages/home_page.dart';
import 'package:foodaholic_app_v/pages/login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.blue,
        primaryColor: Colors.white,
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'home',
      routes:{
        '/': (BuildContext context) => HomePage(),
        'login': (BuildContext context)=> LoginPage(),
      },
    );
  }
}
