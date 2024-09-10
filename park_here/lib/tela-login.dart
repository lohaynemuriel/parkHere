import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log in',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'nome@exemplo.com',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Ação de cadastro
              },
              child: Text('NÃO TEM UMA CONTA? CADASTRE-SE AQUI'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação de login
              },
              child: Text('LOG IN'),
            ),
          ],
        ),
      ),
    );
  }
}
