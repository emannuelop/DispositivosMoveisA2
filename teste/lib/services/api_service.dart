import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';
import '../models/disciplina.dart';

class ApiService {
  static const String baseUrl = 'https://68497d4145f4c0f5ee71a8c8.mockapi.io/api/v1/sistema';

  // Buscar usuários
  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar usuários');
    }
  }

  // Buscar disciplinas
  static Future<List<Disciplina>> fetchDisciplinas() async {
    final response = await http.get(Uri.parse('$baseUrl/disciplinas'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Disciplina.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar disciplinas');
    }
  }
}
