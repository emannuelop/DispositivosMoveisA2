import 'package:flutter/material.dart';

class BoletimScreen extends StatelessWidget {
  const BoletimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boletim')),
      body: const Center(child: Text('Conteúdo da tela Boletim')),
    );
  }
}
