import 'package:flutter/material.dart';
import '../models/usuario.dart';

class UserProvider extends ChangeNotifier {
  User? _usuario;

  User? get usuario => _usuario;

  void login(User user) {
    _usuario = user;
    notifyListeners();
  }

  void logout() {
    _usuario = null;
    notifyListeners();
  }

  bool get isLogado => _usuario != null;
}
