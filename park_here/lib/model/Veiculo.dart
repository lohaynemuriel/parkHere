class Veiculo {
  final String type;
  final String model;
  final String licensePlate;

  // Construtor
  Veiculo({
    required this.type,
    required this.model,
    required this.licensePlate,
  });

  // Método fromMap para criar um Veiculo a partir de um Map
  factory Veiculo.fromMap(Map<String, dynamic> map) {
    return Veiculo(
      type: map['type'] ??
          '', // Adicionando um valor default caso o campo esteja vazio
      model: map['model'] ?? '',
      licensePlate: map['licensePlate'] ?? '',
    );
  }

  // Método toMap para converter o objeto em um Map (caso precise salvar no Firestore)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'model': model,
      'licensePlate': licensePlate,
    };
  }
}
