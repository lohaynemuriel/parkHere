import 'package:cloud_firestore/cloud_firestore.dart';

class Vaga {
  final int codigoVaga;
  final String endereco;
  final String situacao;

  Vaga({
    required this.codigoVaga,
    required this.endereco,
    required this.situacao,
  });

  factory Vaga.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Vaga(
      codigoVaga: data['codigo'] ?? '',
      endereco: data['endereco'] ?? '',
      situacao: data['situacao'] ?? '',
    );
  }
}
