class Disciplina {
  final String codigo;
  final String nome;
  final String ch;

  Disciplina({
    required this.codigo,
    required this.nome,
    required this.ch,
  });

  factory Disciplina.fromMap(Map<String, String> map) {
    return Disciplina(
      codigo: map['Código'] ?? '',
      nome: map['Disciplina'] ?? '',
      ch: map['CH'] ?? '',
    );
  }

  Map<String, String> toMap() {
    return {
      'Código': codigo,
      'Disciplina': nome,
      'CH': ch,
    };
  }

  @override
  String toString() => '$codigo - $nome ($ch h)';
}