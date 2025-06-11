import 'package:flutter/material.dart';
import 'package:secretaria_app/screens/rematricula_final_screen.dart';
import '../models/disciplina.dart';
import '../models/usuario.dart';
import '../services/grade_service.dart';

class RematriculaScreen extends StatefulWidget {
  final User usuario;

  const RematriculaScreen({super.key, required this.usuario});

  @override
  State<RematriculaScreen> createState() => _RematriculaScreenState();
}

class _RematriculaScreenState extends State<RematriculaScreen> {
  List<Disciplina> disciplinasDisponiveis = [];
  Set<String> selecionadas = {};
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    _carregarDisciplinas();
  }

  Future<void> _carregarDisciplinas() async {
    try {
      final periodo = widget.usuario.periodo;
      final disciplinas = await GradeService.fetchDisciplinasPorPeriodo(periodo);

      setState(() {
        disciplinasDisponiveis = disciplinas;
        carregando = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao carregar disciplinas.')),
      );
    }
  }

  void confirmarMatricula() {
    final escolhidas = disciplinasDisponiveis
        .where((d) => selecionadas.contains(d.codigo))
        .map((d) => {
      'Código': d.codigo,
      'Disciplina': d.nome,
      'CH': d.ch,
    })
        .toList();

    setState(() {
      widget.usuario.disciplinasMatriculadas = escolhidas;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Matrícula realizada com sucesso!')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            RematriculaFinalScreen(nomeUsuario: widget.usuario.nome),
      ),
    );
  }

  bool get _deveRedirecionar =>
      widget.usuario.jaRematriculado ||
          widget.usuario.disciplinasMatriculadas.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    if (_deveRedirecionar) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RematriculaFinalScreen(
              nomeUsuario: widget.usuario.nome,
            ),
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Rematrícula - ${widget.usuario.periodo}º Período"),
      ),
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rematrícula',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0056A4),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Selecione as Disciplinas',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0056A4),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: disciplinasDisponiveis.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) {
                  final disciplina = disciplinasDisponiveis[index];
                  final selecionada = selecionadas.contains(disciplina.codigo);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selecionada) {
                          selecionadas.remove(disciplina.codigo);
                        } else {
                          selecionadas.add(disciplina.codigo);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selecionada
                            ? const Color(0xFFE4F1F9)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selecionada
                              ? const Color(0xFF0056A4)
                              : Colors.grey.shade400,
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        disciplina.nome,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed:
                selecionadas.isNotEmpty ? confirmarMatricula : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: const Color(0xFF0056A4),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  disabledBackgroundColor: Colors.grey.shade300,
                  disabledForegroundColor: Colors.grey.shade600,
                ),
                child: const Text(
                  "Confirmar Matrícula",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
