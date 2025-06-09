import '../models/disciplina.dart';

class GradeService {
  static final Map<String, List<Disciplina>> grade = {
    "1º Período": [
      Disciplina(codigo: "011001131", nome: "ALGORITMOS E PROGRAMAÇÃO I", ch: "60"),
      Disciplina(codigo: "011001132", nome: "ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES I", ch: "60"),
      Disciplina(codigo: "011001133", nome: "DESENVOLVIMENTO FRONT-END", ch: "60"),
      Disciplina(codigo: "011001134", nome: "INGLÊS INSTRUMENTAL", ch: "60"),
      Disciplina(codigo: "011001135", nome: "LEITURA E PRÁTICA DE PRODUÇÃO TEXTUAL", ch: "60"),
    ],
    // Outros períodos...
    "2º Período": [
      Disciplina(codigo: "011001136", nome: "PRÉ-CÁLCULO", ch: "60"),
      // ... (restante das disciplinas do 2º período)
    ],
    "3º Período": [
      // ...
    ],
    "4º Período": [
      // ...
    ],
    "5º Período": [
      // ...
    ],
    "6º Período": [
      // ...
    ],
    "7º Período": [
      // ...
    ],
    "8º Período": [
      // ...
    ],
    "Optativas": [
      // ...
    ],
  };

  static List<Disciplina> getDisciplinasPrimeiroPeriodo() {
    return grade["1º Período"] ?? [];
  }

  static Map<String, List<Disciplina>> getGradeCompleta() {
    return grade;
  }
}
