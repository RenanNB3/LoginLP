import 'package:flutter/material.dart';
import 'package:login/home.dart';
import 'package:login/login.dart';
void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        
        '/home': (context) => HomePage(),
      },
    );
  }
}