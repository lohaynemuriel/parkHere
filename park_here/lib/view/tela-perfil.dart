// ignore: file_names
import 'package:flutter/material.dart';
import 'package:park_here/view/layout/my_bottom_navigation_bar.dart';
import 'package:park_here/view/widgets/confirmation_dialog.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/tela-principal');
          },
        ),
        title: const Text('Perfil - ParkHere',
            style: TextStyle(fontWeight: FontWeight.bold)),
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
                    ConfirmationDialog.show(
                      context,
                      'Perfil salvo com sucesso',
                      'Clique em "OK" para voltar ao menu',
                      '/tela-principal',
                    );
                  },
                  child: const Text('SALVAR'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
