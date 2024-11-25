import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PagamentoProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> salvarPagamento({
    required String metodoPagamento,
    required String tempoPermanencia,
    required int vagaId,
    required String placaVeiculo,
    required String numeroCartao,
    required String nomeTitular,
    required String validade,
    required String cvv,
  }) async {
    try {
      // Obter o ID do usuário logado
      final userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId == null) {
        throw Exception("Usuário não está autenticado");
      }

      print('Salvando pagamento com os seguintes dados:');
      print('Método de Pagamento: $metodoPagamento');
      print('Tempo de Permanência: $tempoPermanencia');
      print('ID da Vaga: $vagaId');
      print('Placa do Veículo: $placaVeiculo');

      // Criar um documento no Firestore
      await FirebaseFirestore.instance.collection('compras').add({
        'userId': userId,
        'metodoPagamento': metodoPagamento,
        'tempoPermanencia': tempoPermanencia, // Salvando o tempo
        'vagaId': vagaId, // Salvando o ID da vaga
        'placaVeiculo': placaVeiculo, // Salvando a placa do veículo
        'numeroCartao': numeroCartao,
        'nomeTitular': nomeTitular,
        'validade': validade,
        'cvv': cvv,
        'dataPagamento': FieldValue.serverTimestamp(),
      });

      return true;
    } catch (e) {
      debugPrint("Erro ao salvar pagamento: $e");
      return false;
    }
  }
}
