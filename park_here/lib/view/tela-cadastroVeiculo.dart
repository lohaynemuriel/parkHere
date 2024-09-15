import 'package:flutter/material.dart';

class VehicleRegisterScreen extends StatefulWidget {
  const VehicleRegisterScreen({super.key});

  @override
  VehicleRegisterScreenState createState() => VehicleRegisterScreenState();
}

class VehicleRegisterScreenState extends State<VehicleRegisterScreen> {
  String _vehicleType = 'Carro';
  String _selectedModel = 'Volkswagen Gol';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre um veículo - ParkHere'),
        centerTitle: true,
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
            TextFormField(
              decoration: const InputDecoration(labelText: 'Placa'),
            ),
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
            ElevatedButton(
              onPressed: () {
                // Handle vehicle registration logic
              },
              child: const Text('SIGN UP'),
            ),
          ],
        ),
      ),
    );
  }
}
