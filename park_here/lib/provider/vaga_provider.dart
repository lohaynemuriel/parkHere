import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:park_here/model/Vaga.dart';

class VagasProvider with ChangeNotifier {
  final List<Vaga> _vagas = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Vaga> get vagasDisponiveis =>
      _vagas.where((vaga) => vaga.situacao == "N").toList();

  Future<void> loadVagas() async {
    try {
      final querySnapshot = await _firestore.collection('vagas').get();
      _vagas.clear();
      _vagas.addAll(
        querySnapshot.docs.map((doc) => Vaga.fromFirestore(doc)).toList(),
      );
      notifyListeners();
    } catch (e) {
      debugPrint("Erro ao carregar vagas: $e");
    }
  }
}
