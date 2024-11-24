import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:park_here/model/veiculo.dart'; // Importe o modelo do veículo

class VeiculoProvider with ChangeNotifier {
  Veiculo? _veiculo; // Agora o nome da variável é _veiculo

  Veiculo? get veiculo => _veiculo;

  // Veiculoregar o veículo do Firebase
  Future<void> loadVeiculo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        // Busveiculo os dados do veículo do Firebase Firestore
        final veiculoDoc = await FirebaseFirestore.instance
            .collection(
                'veiculos') // Assumindo que a coleção se chama 'veiculoros'
            .doc(user
                .uid) // Usando o UID do usuário para identifiveiculo o documento
            .get();

        if (veiculoDoc.exists) {
          _veiculo = Veiculo.fromMap(
              veiculoDoc.data()!); // Criando o objeto a partir do map
        }
      } catch (e) {
        print('Erro ao veiculoregar o veículo: $e');
      }
      notifyListeners(); // Notifiveiculo os ouvintes após o veiculoregamento
    }
  }

  // Método para registrar o veículo
  void registerVeiculo(String type, String model, String licensePlate) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _veiculo = Veiculo(type: type, model: model, licensePlate: licensePlate);

      // Salvar no Firebase Firestore
      FirebaseFirestore.instance.collection('veiculos').doc(user.uid).set({
        'clientId': user.uid,
        'type': type,
        'model': model,
        'licensePlate': licensePlate,
      });

      notifyListeners(); // Notifiveiculo os ouvintes após o cadastro
    }
  }
}
