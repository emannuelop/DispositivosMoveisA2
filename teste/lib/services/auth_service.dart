import '../models/user.dart';

class AuthService {
  static final User _usuarioFixo = User(
    nome: 'João da Silva',
    cpf: '123.456.789-00',
    matricula: '2021001234',
    curso: 'Sistemas de Informação',
    situacao: 'Ativo',
    senha: '123456',
  );

  static User? _usuarioLogado;

  static bool login(String cpf, String senha) {
    if (cpf == _usuarioFixo.cpf && senha == _usuarioFixo.senha) {
      _usuarioLogado = _usuarioFixo;
      return true;
    }
    return false;
  }

  static void logout() {
    _usuarioLogado = null;
  }

  static User? get usuario => _usuarioLogado;
}
