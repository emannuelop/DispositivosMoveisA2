import 'package:flutter/material.dart';
import '../../models/usuario.dart';

class AnaliseCurricularScreen extends StatelessWidget {
  final User usuario;

  const AnaliseCurricularScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    final dados = [
      {
        'matricula': usuario.matricula,
        'cpf': usuario.cpf,
        'nome': usuario.nome,
        'curso': usuario.curso,
        'modalidade': 'CÂMPUS PALMAS',
        'status': usuario.situacao,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Análise Curricular'),
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
              'Análise Curricular',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: Color(0xFF555555),
              ),
            ),
            const SizedBox(height: 24),
            Table(
              border: TableBorder.all(width: 0.5, color: Colors.blue.shade900),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(3),
                3: FlexColumnWidth(3),
                4: FlexColumnWidth(2.5),
                5: FlexColumnWidth(2),
                6: FixedColumnWidth(50),
              },
              children: [
                _buildHeaderRow(),
                for (int i = 0; i < dados.length; i++)
                  _buildDataRow(dados[i], i.isEven),
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
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
            )
          ],
        ),
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(
        color: Color(0xFF0033A0),
      ),
      children: const [
        _HeaderCell('Matrícula'),
        _HeaderCell('CPF'),
        _HeaderCell('Nome'),
        _HeaderCell('Curso'),
        _HeaderCell('Modalidade'),
        _HeaderCell('Status'),
        _HeaderCell('Ação'),
      ],
    );
  }

  TableRow _buildDataRow(Map<String, String> data, bool isEven) {
    final textColor = const Color(0xFF0033A0);
    final bgColor = isEven ? Colors.white : const Color(0xFFF9F9F9);

    return TableRow(
      decoration: BoxDecoration(color: bgColor),
      children: [
        _DataCell(data['matricula']!, textColor),
        _DataCell(data['cpf']!, textColor),
        _DataCell(data['nome']!, textColor),
        _DataCell(data['curso']!, textColor),
        _DataCell(data['modalidade']!, textColor),
        _DataCell(data['status']!, textColor),
        const IconCell(),
      ],
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String text;
  final Color color;

  const _DataCell(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}

class IconCell extends StatelessWidget {
  const IconCell();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.show_chart,
        color: Color(0xFF0033A0),
      ),
    );
  }
}
