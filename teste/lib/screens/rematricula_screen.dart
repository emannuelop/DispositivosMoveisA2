/*import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/disciplina.dart';
import '../services/grade_service.dart';

class RematriculaScreen extends StatefulWidget {
  const RematriculaScreen({super.key});

  @override
  State<RematriculaScreen> createState() => _RematriculaScreenState();
}

class _RematriculaScreenState extends State<RematriculaScreen> {
  final Map<String, bool> _selecionadas = {};

  @override
  void initState() {
    super.initState();
    final usuario = AuthService.usuarioAtual;
    if (!usuario!.podeRematricular) return;

    final disciplinas = GradeService.getTodasDisciplinas();
    for (var disc in disciplinas) {
      _selecionadas[disc.codigo] = false;
    }
  }

  void _confirmarMatricula() {
    final selecionadas = _selecionadas.entries
        .where((e) => e.value)
        .map((e) => GradeService.getDisciplinaPorCodigo(e.key))
        .whereType<Disciplina>()
        .toList();

    if (selecionadas.isEmpty) return;

    final usuario = AuthService.usuarioAtual;
    usuario?.disciplinasMatriculadas.addAll(selecionadas);
    usuario?.podeRematricular = false;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Matrícula realizada com sucesso!')),
    );

    setState(() {}); // Atualiza a tela para mostrar a versão "bloqueada"
  }

  @override
  Widget build(BuildContext context) {
    final usuario = AuthService.usuarioAtual;

    if (usuario == null) {
      return const Scaffold(body: Center(child: Text('Usuário não logado.')));
    }

    if (!usuario.podeRematricular) {
      return Scaffold(
        appBar: AppBar(title: const Text('Rematrícula')),
        body: const Center(child: Text('Você já está matriculado.')),
      );
    }

    final disciplinas = GradeService.getTodasDisciplinas();

    return Scaffold(
      appBar: AppBar(title: const Text('Rematrícula')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Selecione as disciplinas que deseja se matricular:',
              style: TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          ...disciplinas.map((disc) {
            return CheckboxListTile(
              title: Text(disc.nome),
              subtitle: Text('Código: ${disc.codigo} | CH: ${disc.ch}'),
              value: _selecionadas[disc.codigo] ?? false,
              onChanged: (value) {
                setState(() {
                  _selecionadas[disc.codigo] = value ?? false;
                });
              },
            );
          }),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _confirmarMatricula,
            child: const Text('Confirmar Matrícula'),
          ),
        ],
      ),
    );
  }
}
*/