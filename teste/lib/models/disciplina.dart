class Disciplina {
  final String codigo;
  final String nome;
  final String ch;
  final String periodo;

  Disciplina({
    required this.codigo,
    required this.nome,
    required this.ch,
    required this.periodo,
  });

  factory Disciplina.fromJson(Map<String, dynamic> json) {
    return Disciplina(
      codigo: json['codigo'],
      nome: json['nome'],
      ch: json['ch'],
      periodo: json['periodo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'nome': nome,
      'ch': ch,
      'periodo': periodo,
    };
  }
}
