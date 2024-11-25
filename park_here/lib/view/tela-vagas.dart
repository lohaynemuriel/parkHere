import 'package:flutter/material.dart';
import 'package:park_here/provider/vaga_provider.dart';
import 'package:provider/provider.dart';
import 'tela-confirmarVaga.dart';

class Vagas extends StatefulWidget {
  const Vagas({super.key});

  @override
  _VagasState createState() => _VagasState();
}

class _VagasState extends State<Vagas> {
  int? _selectedVagaCodigo;

  @override
  Widget build(BuildContext context) {
    final vagasProvider = Provider.of<VagasProvider>(context);
    final vagas = vagasProvider.vagasDisponiveis;

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
        child: vagas.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: vagas.length,
                      itemBuilder: (context, index) {
                        final vaga = vagas[index];
                        return ListTile(
                          leading: Image.asset(
                            'assets/vagas.png',
                            width: 40,
                            height: 40,
                          ),
                          title: Text(
                            'Vaga nº ${vaga.codigoVaga}\n${vaga.endereco}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          trailing: Radio<int>(
                            value: vaga.codigoVaga,
                            groupValue: _selectedVagaCodigo,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedVagaCodigo = value;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: _selectedVagaCodigo != null
                          ? () {
                              final vagaSelecionada = vagas.firstWhere(
                                (vaga) =>
                                    vaga.codigoVaga == _selectedVagaCodigo,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConfirmarVagaScreen(
                                      vaga: vagaSelecionada),
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
