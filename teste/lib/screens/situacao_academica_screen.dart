import 'package:flutter/material.dart';

class SituacaoAcademicaScreen extends StatelessWidget {
  const SituacaoAcademicaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final documentos = [
      {'nome': 'Foto (Obrigatório)', 'status': true},
      {'nome': 'Carteira de Identidade/RG (Obrigatório)', 'status': true},
      {'nome': 'Certidão de Nascimento/Casamento (Obrigatório)', 'status': true},
      {'nome': 'Histórico Escolar - Ensino Médio (Obrigatório)', 'status': true},
      {'nome': 'Certificado Militar/Reservista', 'status': true},
      {'nome': 'CPF (CIC) (Obrigatório)', 'status': true},
      {'nome': 'Diploma/Certificado Registrado (Obrigatório)', 'status': true},
      {'nome': 'Comprovante de Vacina', 'status': true},
      {'nome': 'Título de Eleitor (Obrigatório)', 'status': true},
      {'nome': 'Comprovante de Votação (Obrigatório)', 'status': true},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Situação Acadêmica'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReadOnlyField('Nº de Matrícula', '0000000000000000'),
            _buildReadOnlyField('Nome', 'JOHN DEV'),
            _buildReadOnlyField('Curso', 'SISTEMAS DE INFORMAÇÃO'),
            _buildReadOnlyField('Situação', 'Matriculado'),
            const SizedBox(height: 16),
            const Text(
              'Documentos:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: documentos.length,
              itemBuilder: (context, index) {
                final doc = documentos[index];
                final status = doc['status'] as bool;
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        status ? Icons.check_circle : Icons.cancel,
                        color: status ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(doc['nome'] as String),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24), // Espaço antes do botão
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: const Text('Voltar'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: const BorderSide(color: Colors.grey),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )),
          const SizedBox(height: 4),
          TextFormField(
            initialValue: value,
            readOnly: true,
            enabled: false,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFFF5F5F5),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
