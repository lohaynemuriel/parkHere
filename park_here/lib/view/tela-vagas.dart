import 'package:flutter/material.dart';
import 'tela-confirmarVaga.dart';

class Vagas extends StatefulWidget {
  const Vagas({super.key});

  @override
  _VagasState createState() => _VagasState();
}

class _VagasState extends State<Vagas> {
  int? _selectedVaga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Vagas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Insira o endereço ou código da vaga',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/vagas.png',
                      width: 40,
                      height: 40,
                    ),
                    title: const Text(
                      'Vaga nº 9876\nAvenida Limeira, 563 - Limeira, SP',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Radio<int>(
                      value: 9876,
                      groupValue: _selectedVaga,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedVaga = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/vagas.png',
                      width: 40,
                      height: 40,
                    ),
                    title: const Text(
                      'Vaga nº 9875\nAvenida Limeira, 563 - Limeira, SP',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Radio<int>(
                      value: 9875,
                      groupValue: _selectedVaga,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedVaga = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/vagas.png',
                      width: 40,
                      height: 40,
                    ),
                    title: const Text(
                      'Vaga nº 9874\nAvenida Limeira, 563 - Limeira, SP',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Radio<int>(
                      value: 9874,
                      groupValue: _selectedVaga,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedVaga = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _selectedVaga != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ConfirmarVagaScreen(vaga: _selectedVaga!),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(343, 52),
                  textStyle: const TextStyle(fontSize: 12),
                ),
                child: const Text('CONFIRMAR VAGA'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
