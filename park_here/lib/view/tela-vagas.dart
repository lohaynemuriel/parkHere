import 'package:flutter/material.dart';

import 'tela-confirmarVaga.dart';

class Vagas extends StatefulWidget {
  @override
  _VagasState createState() => _VagasState();
}

class _VagasState extends State<Vagas> {
  int? _selectedVaga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Vagas', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA7CFFF), Color(0xFFFEF7FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Insira o endereço ou código da vaga',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    RadioListTile<int>(
                      title: Text(
                          'Vaga nº 9876\nAvenida Limeira, 9876 - Limeira, SP'),
                      value: 9876,
                      groupValue: _selectedVaga,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedVaga = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: Text(
                          'Vaga nº 9875\nAvenida Limeira, 9875 - Limeira, SP'),
                      value: 9875,
                      groupValue: _selectedVaga,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedVaga = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: Text(
                          'Vaga nº 563\nAvenida Limeira, 563 - Limeira, SP'),
                      value: 563,
                      groupValue: _selectedVaga,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedVaga = value;
                        });
                      },
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
                  child: Text('CONFIRMAR VAGA'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(343, 52),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
