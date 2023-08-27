import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<HomePage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

  double bmiResult = 0;
  String resultText = "";

  bool areFieldsEmpty() {
    return pesoController.text.isEmpty || alturaController.text.isEmpty;
  }

  void calculateBMI() {
    double weight = double.tryParse(pesoController.text) ?? 0;
    double height = double.tryParse(alturaController.text) ?? 0;

    if (weight > 0 && height > 0) {
      double bmi = weight / (height * height);
      setState(() {
        bmiResult = bmi;
        if (bmi < 18.5) {
          resultText = "Abaixo do peso";
        } else if (bmi < 24.9) {
          resultText = "Normal";
        } else if (bmi < 29.9) {
          resultText = "Acima do peso";
        } else {
          resultText = "Obeso";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Calculadora de IMC",
          style: TextStyle(
            color: Colors.white, // Defina a cor desejada para o texto
            fontSize: 18, // Tamanho do texto
            fontWeight: FontWeight.bold, // Peso da fonte
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 5, 50, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(bottom: 45.0),
              height: 90 * fem,   
              width: 90 * fem,    
              child: Padding(
                  padding: EdgeInsets.only(top: 4),
                    child: Image.asset(
                        'assets/images.jpg', 
                        fit: BoxFit.cover,      
                      ),
                    ),
              ),
          
          
            Container(
              padding:
                  EdgeInsets.fromLTRB(30 * fem, 5 * fem, 14 * fem, 20 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(167, 255, 255, 255),
                borderRadius: BorderRadius.circular(20.2134838104 * fem),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0 * fem, 2 * fem),
                    blurRadius: 2 * fem,
                  ),
                ],
              ),
              //colunas
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5),
                  TextField(
                    controller: idadeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Idade"),
                  ),
                  TextField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Peso (kg)"),
                  ),
                  TextField(
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Altura (m)"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text("IMC: $bmiResult"),
            Text("Resultado: $resultText"),

            ElevatedButton(
              onPressed: () {
                if (areFieldsEmpty()) {
                  final snackBar = SnackBar(
                    content: Text('Por favor, preencha todos os campos.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  double? altura = double.tryParse(alturaController.text);
                  if (altura != null && altura <= 3.0) {
                    calculateBMI();
                  } else {
                    final snackBar = SnackBar(
                      content: Text('A altura deve ser menor ou igual a 3 metros.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  double? peso = double.tryParse(pesoController.text);
                  if (peso != null && peso <= 500.0) {
                    calculateBMI();
                  } else {
                    final snackBar = SnackBar(
                      content: Text('O peso máximo permitido é 500 kg'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              child: Text("Calcular"),
            ),
          ],
        ),
      ),
    );
  }
}
