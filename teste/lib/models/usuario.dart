class User {
  final String nome;
  final String cpf;
  final String matricula;
  final String curso;
  final String situacao;
  final String senha;
  final String periodo; // ← novo atributo
  List<Map<String, String>> disciplinasMatriculadas;

  User({
    required this.nome,
    required this.cpf,
    required this.matricula,
    required this.curso,
    required this.situacao,
    required this.senha,
    required this.periodo,
    this.disciplinasMatriculadas = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nome: json['nome'],
      cpf: json['cpf'],
      matricula: json['matricula'],
      curso: json['curso'],
      situacao: json['situacao'],
      senha: json['senha'],
      periodo: json['periodo'] ?? '1',
      disciplinasMatriculadas: (json['disciplinasMatriculadas'] as List?)
          ?.map((d) => Map<String, String>.from(d))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'cpf': cpf,
    'matricula': matricula,
    'curso': curso,
    'situacao': situacao,
    'senha': senha,
    'periodo': periodo,
    'disciplinasMatriculadas': disciplinasMatriculadas,
  };

  bool get jaRematriculado => disciplinasMatriculadas.isNotEmpty;
}
