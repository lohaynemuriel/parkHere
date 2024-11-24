import 'package:flutter/material.dart';
import 'package:park_here/provider/veiculo_provider.dart';
import 'package:park_here/view/widgets/confirmation_dialog.dart';
import 'package:provider/provider.dart';

class VehicleRegisterScreen extends StatefulWidget {
  const VehicleRegisterScreen({super.key});

  @override
  VehicleRegisterScreenState createState() => VehicleRegisterScreenState();
}

class VehicleRegisterScreenState extends State<VehicleRegisterScreen> {
  String _vehicleType = 'Carro';
  String _selectedModel = 'Volkswagen Gol';
  final _licensePlateController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _licensePlateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Acessando o estado do CarProvider
    final car = context.watch<VeiculoProvider>().veiculo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre um veículo - ParkHere'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cadastre um veículo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Tipo de veículo (Radio buttons)
            Row(
              children: [
                Radio<String>(
                  value: 'Carro',
                  groupValue: _vehicleType,
                  onChanged: (value) {
                    setState(() {
                      _vehicleType = value!;
                    });
                  },
                ),
                const Text('Carro'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Moto',
                  groupValue: _vehicleType,
                  onChanged: (value) {
                    setState(() {
                      _vehicleType = value!;
                    });
                  },
                ),
                const Text('Moto'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Ônibus/Caminhão',
                  groupValue: _vehicleType,
                  onChanged: (value) {
                    setState(() {
                      _vehicleType = value!;
                    });
                  },
                ),
                const Text('Ônibus/Caminhão'),
              ],
            ),
            const SizedBox(height: 20),
            // Campo de texto para a placa do veículo
            TextFormField(
              controller: _licensePlateController,
              decoration: const InputDecoration(labelText: 'Placa'),
            ),
            const SizedBox(height: 20),
            // Dropdown para selecionar o modelo do veículo
            DropdownButtonFormField<String>(
              value: _selectedModel,
              items: const [
                DropdownMenuItem(
                    value: 'Volkswagen Gol', child: Text('Volkswagen Gol')),
                DropdownMenuItem(value: 'Fiat Uno', child: Text('Fiat Uno')),
                DropdownMenuItem(
                    value: 'Chevrolet Onix', child: Text('Chevrolet Onix')),
                DropdownMenuItem(
                    value: 'Fiat Palio', child: Text('Fiat Palio')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedModel = value!;
                });
              },
              decoration: const InputDecoration(labelText: 'Escolha o modelo'),
            ),
            const SizedBox(height: 20),
            // Botão para finalizar o cadastro do veículo
            Center(
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        setState(() {
                          _isLoading = true;
                        });

                        try {
                          // Registro do veículo no CarProvider
                          Provider.of<VeiculoProvider>(context, listen: false)
                              .registerVeiculo(
                            _vehicleType,
                            _selectedModel,
                            _licensePlateController.text,
                          );

                          // Exibe o diálogo de confirmação após o cadastro
                          ConfirmationDialog.show(
                            context,
                            'Cadastro realizado',
                            '',
                            '/tela-principal',
                          );
                        } catch (e) {
                          // Caso ocorra um erro, exibe uma mensagem
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Erro'),
                              content: Text('Erro ao salvar veículo: $e'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } finally {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      },
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Cadastrar Veículo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
