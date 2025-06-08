import 'package:flutter/material.dart';

class BoletimScreen extends StatelessWidget {
  const BoletimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final disciplinas = [
      {
        'codigo': '011001171',
        'nome': 'ELABORAÇÃO E GESTÃO DE PROJETOS',
      },
      {
        'codigo': '011001173',
        'nome': 'MINERAÇÃO DE DADOS',
      },
      {
        'codigo': '011001174',
        'nome': 'PROGRAMAÇÃO PARA DISPOSITIVOS MÓVEIS II',
      },
      {
        'codigo': '011001172',
        'nome': 'SISTEMAS DISTRIBUÍDOS',
      },
      {
        'codigo': '011001188',
        'nome': 'TÓPICOS ESPECIAIS EM PROGRAMAÇÃO',
      },
      {
        'codigo': '011001175',
        'nome': 'TRABALHO DE CONCLUSÃO DE CURSO I',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boletim Acadêmico'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SISTEMAS DE INFORMAÇÃO',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Disciplinas do Semestre Letivo',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF0056A4),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                          (states) => const Color(0xFFDCDCDC), // Cor de fundo do cabeçalho
                    ),
                    dataRowMinHeight: 28,
                    dataRowMaxHeight: 32,
                    columns: const [
                      DataColumn(label: Text('Período Letivo')),
                      DataColumn(label: Text('Código')),
                      DataColumn(label: Text('Disciplina')),
                      DataColumn(label: Text('Faltas')),
                      DataColumn(label: Text('A1')),
                      DataColumn(label: Text('A2')),
                      DataColumn(label: Text('Exame Final')),
                      DataColumn(label: Text('Média Semestral')),
                      DataColumn(label: Text('Média Final')),
                      DataColumn(label: Text('Situação')),
                    ],
                    rows: List.generate(disciplinas.length, (index) {
                      final disc = disciplinas[index];
                      return DataRow(
                        cells: [
                          DataCell(Text('2025/01')),
                          DataCell(Text(disc['codigo']!)),
                          DataCell(Text(disc['nome']!)),
                          DataCell(Text('0')),
                          DataCell(Text('')),
                          DataCell(Text('')),
                          DataCell(Text('')),
                          DataCell(Text('')),
                          DataCell(Text('')),
                          DataCell(Text('Matriculado')),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '* Situação passiva de alteração no decorrer do período letivo.\n- Documento sem valor legal.\n+ Clique para ver os detalhes da nota.',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 20),
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
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // ação de imprimir
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: const Color(0xFF0056A4),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text("Imprimir"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}