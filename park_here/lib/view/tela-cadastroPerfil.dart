import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro - ParkHere'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cadastro',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome completo'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Celular com DDD'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Data de nascimento'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'CPF'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Confirme a senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tela-login');
              },
              child: const Text('PRÓXIMO'),
            ),
          ],
        ),
      ),
    );
  }
}
