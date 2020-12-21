import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title:Text('Inicio de sesión'),
           centerTitle: true,
         ),
         body: Center(
           child: Text('Formulario de inicio de sesión'),
         ),
       ),
    );
  }
}