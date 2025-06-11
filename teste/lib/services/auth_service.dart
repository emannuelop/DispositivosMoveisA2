import '../models/usuario.dart';
import 'api_service.dart';

class AuthService {
  static User? _usuarioLogado;

  static Future<User?> login(String cpf, String senha) async {
    final usuarios = await ApiService.fetchUsers();
    try {
      final user = usuarios.firstWhere(
            (u) => u.cpf == cpf && u.senha == senha,
      );
      _usuarioLogado = user;
      return user;
    } catch (e) {
      return null;
    }
  }

  static void logout() {
    _usuarioLogado = null;
  }

  static User? get usuario => _usuarioLogado;
}
