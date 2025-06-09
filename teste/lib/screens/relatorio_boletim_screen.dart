import 'package:flutter/material.dart';
import '../models/usuario.dart';
import 'boletim_screen.dart';

class RelatorioBoletimScreen extends StatefulWidget {
  final User usuario;

  const RelatorioBoletimScreen({super.key, required this.usuario});

  @override
  State<RelatorioBoletimScreen> createState() => _RelatorioBoletimScreenState();
}

class _RelatorioBoletimScreenState extends State<RelatorioBoletimScreen> {
  int? _selectedCourseIndex;

  final List<String> _courses = [
    'SISTEMAS DE INFORMAÇÃO/CÂMPUS PALMAS (Matriculado)',
  ];

  @override
  Widget build(BuildContext context) {
    final temDisciplinas = widget.usuario.disciplinasMatriculadas.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
        title: const Text('Boletim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Curso',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xFF0056A4),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Selecione o Curso',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF0056A4),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: temDisciplinas
                  ? ListView.builder(
                itemCount: _courses.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: index,
                          groupValue: _selectedCourseIndex,
                          onChanged: (value) {
                            setState(() {
                              _selectedCourseIndex = value;
                            });
                          },
                          activeColor: Colors.grey,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _courses[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF5F6368),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
                  : const Center(
                child: Text(
                  'Você ainda não está matriculado em nenhuma disciplina.\nRealize a rematrícula primeiro.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: const BorderSide(color: Colors.grey),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text('Voltar'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: temDisciplinas && _selectedCourseIndex != null
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BoletimScreen(usuario: widget.usuario),
                      ),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: const Color(0xFF0056A4),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    disabledBackgroundColor: Colors.grey.shade300,
                    disabledForegroundColor: Colors.grey.shade600,
                  ),
                  child: const Text('Próximo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
