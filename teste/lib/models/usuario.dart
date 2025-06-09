class User {
  final String nome;
  final String cpf;
  final String matricula;
  final String curso;
  final String situacao;
  final String senha;
  List<Map<String, String>> disciplinasMatriculadas;

  User({
    required this.nome,
    required this.cpf,
    required this.matricula,
    required this.curso,
    required this.situacao,
    required this.senha,
    this.disciplinasMatriculadas = const [],
  });

  bool get jaRematriculado => disciplinasMatriculadas.isNotEmpty;
}
