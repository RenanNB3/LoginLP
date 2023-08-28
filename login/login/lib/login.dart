import 'package:flutter/material.dart';
import 'package:login/home.dart';
import 'package:login/reset-password_page.dart'; // Asegúrate de importar la página ResetPasswordPage correctamente

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              child: Image.asset('assets/log.png'),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Nome de Usuário'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  'Recuperar Senha',
                  textAlign: TextAlign.end,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                  );
                  // Lógica para recuperar a senha
                },
              ),
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Validar si los campos están llenos
                  if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Você deve preencher todos os dados.'),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login realizado com sucesso!'),
                      ),
                    );
                  }
                },
                child: Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 40),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
