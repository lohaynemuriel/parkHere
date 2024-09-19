// ignore: file_names
import 'package:flutter/material.dart';
 
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Perfil - ParkHere', 
          style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          // Adiciona rolagem se o conteúdo for maior que a tela
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ajusta a altura da coluna ao conteúdo
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centraliza verticalmente
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centraliza horizontalmente
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/imgperfil.jpg'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Jane',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome completo'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Celular com DDD'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Data de nascimento'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'CNH'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'CPF'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle profile update logic
                  },
                  child: const Text('SALVAR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
