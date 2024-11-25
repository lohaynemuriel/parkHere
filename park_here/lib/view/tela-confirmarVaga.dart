import 'package:flutter/material.dart';
import 'package:park_here/model/Vaga.dart';
import 'package:provider/provider.dart';
import '../provider/veiculo_provider.dart';

class ConfirmarVagaScreen extends StatefulWidget {
  final Vaga vaga;

  const ConfirmarVagaScreen({super.key, required this.vaga});

  @override
  _ConfirmarVagaScreenState createState() => _ConfirmarVagaScreenState();
}

class _ConfirmarVagaScreenState extends State<ConfirmarVagaScreen> {
  String? _tempoPermanenciaSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Estacione',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Consumer<VeiculoProvider>(
        builder: (context, veiculoProvider, child) {
          final veiculo = veiculoProvider.veiculo;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/carro-esporte.png',
                        height: 120,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        veiculo?.licensePlate ?? 'Sem veículo cadastrado',
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Confirme as informações abaixo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${widget.vaga.endereco}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const Icon(Icons.location_on, color: Colors.blue),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tempo de permanência',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['1 hora', '2 horas', '5 horas']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _tempoPermanenciaSelecionado = value;
                    });
                  },
                  value: _tempoPermanenciaSelecionado,
                  hint: const Text('Selecione'),
                ),
                const Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_tempoPermanenciaSelecionado == null ||
                          veiculo == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Por favor, selecione o tempo e adicione um veículo.'),
                          ),
                        );
                        return;
                      }
                      print(
                          'Tempo de Permanência: ${_tempoPermanenciaSelecionado}');
                      print('ID da Vaga: ${widget.vaga.codigoVaga}');
                      print('Placa do Veículo: ${veiculo.licensePlate}');

                      // Navegar para a tela de pagamento com os dados necessários
                      Navigator.pushNamed(
                        context,
                        '/tela-pagamento',
                        arguments: {
                          'vagaId': widget.vaga.codigoVaga,
                          'tempoPermanencia': _tempoPermanenciaSelecionado,
                          'placaVeiculo': veiculo.licensePlate,
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(343, 52),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('IR PARA PAGAMENTO'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
