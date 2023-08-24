import 'package:flutter/material.dart';
import 'package:login/home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20.0 * fem),
              height: 100 * fem,
              width: 100 * fem,
              child: Image.asset(
                'assets/log.png',
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nome de Usuário'),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login realizado com sucesso!'),
                    ),
                  );
                },
                child: Text('Entrar'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 40)),
                  elevation: MaterialStateProperty.all(0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}