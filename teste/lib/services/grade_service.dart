import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/disciplina.dart';

class GradeService {
  static const String baseUrl = 'https://68497d4145f4c0f5ee71a8c8.mockapi.io/api/v1/sistema';

  /// Busca todas as disciplinas da API
  static Future<List<Disciplina>> fetchTodasDisciplinas() async {
    final response = await http.get(Uri.parse('$baseUrl/disciplinas'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Disciplina.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar disciplinas');
    }
  }

  /// Retorna apenas as disciplinas do período informado (ex: "1")
  static Future<List<Disciplina>> fetchDisciplinasPorPeriodo(String periodo) async {
    final todas = await fetchTodasDisciplinas();
    return todas.where((d) => d.periodo == '${periodo}º Período').toList();
  }

  /// Retorna um mapa com todas as disciplinas organizadas por período
  static Future<Map<String, List<Disciplina>>> fetchGradeCompleta() async {
    final todas = await fetchTodasDisciplinas();
    final Map<String, List<Disciplina>> gradePorPeriodo = {};

    for (final disciplina in todas) {
      gradePorPeriodo.putIfAbsent(disciplina.periodo, () => []);
      gradePorPeriodo[disciplina.periodo]!.add(disciplina);
    }

    return gradePorPeriodo;
  }
}
