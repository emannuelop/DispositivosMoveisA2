import '../models/usuario.dart';

class AuthService {
  static final User _usuarioFixo = User(
    nome: 'John Dev',
    cpf: '123.456.789-00',
    matricula: '2025001234',
    curso: 'Sistemas de Informação',
    situacao: 'Matriculado',
    senha: '123456',
  );
  static User? _usuarioLogado;

  static User? login(String cpf, String senha) {
    if (cpf == _usuarioFixo.cpf && senha == _usuarioFixo.senha) {
      _usuarioLogado = _usuarioFixo;
      return _usuarioFixo;
    }
    return null;
  }

  static void logout() {
    _usuarioLogado = null;
  }

  static User? get usuario => _usuarioLogado;
}
