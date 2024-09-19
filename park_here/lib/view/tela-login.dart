import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: 'nome@exemplo.com',
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastroPerfil');
              },
              child: const Text('NÃO TEM UMA CONTA? CADASTRE-SE AQUI'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação de login
              },
              child: const Text('LOG IN'),
            ),
          ],
        ),
      ),
    );
  }
}
