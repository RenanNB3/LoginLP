import 'package:flutter/material.dart';

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
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double fem = MediaQuery.of(context).size.width/ baseWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
              
              height: 50*fem,
              width: 50*fem,
              child: Image.asset(
                'assets/log.png',
                
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Nome de Usuário'),
            ),
            SizedBox(height: 16.0), // Changed from 32.0
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Lógica de autenticação aquí
                // Por ahora, solo mostraremos un mensaje
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Autenticado con éxito!'),
                  ),
                );
              },
              child: Text('Iniciar sesión'), // Added button label
            ),
          ],
        ),
      ),
    );
  }
}
