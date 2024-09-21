import 'package:flutter/material.dart';

class ConfirmarVagaScreen extends StatelessWidget {
  final int vaga;

  const ConfirmarVagaScreen({super.key, required this.vaga});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/carro-esporte.png', // Substitua pelo ícone do carro
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'ABC 34B3',
                style: TextStyle(
                  fontSize: 28, // Font size similar to the image
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Confirme as informações abaixo',
                style: TextStyle(
                  fontSize: 18, // Font size similar to the image
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Avenida Limeira, 563 - Limeira, SP',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Icon(Icons.location_on, color: Colors.blue),
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
              items:
                  <String>['1 hora', '2 horas', '5 horas'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
              hint: const Text('Selecione'),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tela-pagamento');
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
      ),
    );
  }
}
