import 'package:flutter/material.dart';

class BoletimScreen extends StatefulWidget {
  const BoletimScreen({super.key});

  @override
  State<BoletimScreen> createState() => _BoletimScreenState();
}

class _BoletimScreenState extends State<BoletimScreen> {
  int _selectedCourseIndex = 1;

  final List<String> _courses = [
    'SISTEMAS DE INFORMAÇÃO/CÂMPUS PALMAS (Transferência de Grade)',
    'SISTEMAS DE INFORMAÇÃO/CÂMPUS PALMAS (Matriculado)',
  ];

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: List.generate(_courses.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9F9F9),
                            border: Border(
                              right: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Radio<int>(
                            value: index,
                            groupValue: _selectedCourseIndex,
                            onChanged: (value) {
                              setState(() {
                                _selectedCourseIndex = value!;
                              });
                            },
                            activeColor: Colors.grey,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        // 🔹 Caixa do texto com fundo branco
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                            child: Text(
                              _courses[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF5F6368), // cinza mais leve para o texto
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
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
                  onPressed: () {
                    debugPrint('Curso selecionado: ${_courses[_selectedCourseIndex]}');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: const Color(0xFF0056A4),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
