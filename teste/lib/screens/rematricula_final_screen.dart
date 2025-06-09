import 'package:flutter/material.dart';
import 'home_screen.dart'; // <-- Certifique-se que o caminho está correto

class RematriculaFinalScreen extends StatelessWidget {
  final String nomeUsuario;

  const RematriculaFinalScreen({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
        title: const Text('Rematrícula'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Breadcrumbs
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: const Color(0xFFDCDCDC),
            child: Wrap(
              spacing: 4,
              children: const [
                Text("Apresentação", style: TextStyle(color: Colors.black87)),
                Text(" / "),
                Text("Atualizar Dados Pessoais", style: TextStyle(color: Colors.black87)),
                Text(" / "),
                Text("Quadro de Horário", style: TextStyle(color: Colors.black87)),
                Text(" / "),
                Text("Quadro de Horário", style: TextStyle(color: Colors.black38)),
              ],
            ),
          ),

          // Subtítulo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              'Solicitação Confirmada',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Cartão de confirmação
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE4F1F9),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Prezado(a) aluno(a) '),
                        TextSpan(
                          text: nomeUsuario.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: ','),
                      ],
                    ),
                    style: const TextStyle(fontSize: 16, color: Color(0xFF416f90)),
                  ),
                  const SizedBox(height: 8),
                  const SelectableText.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Sua rematrícula no semestre '),
                        TextSpan(
                          text: '2025/01',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' está confirmada para o curso '),
                        TextSpan(
                          text: 'SISTEMAS DE INFORMAÇÃO.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    style: TextStyle(fontSize: 16, color: Color(0xFF416f90)),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Clique aqui para imprimir seu comprovante de matrícula.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF006ab4),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Clique aqui para imprimir o Termo da Rematrícula Online.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF006ab4),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          // Botão de voltar para a Home
          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                          (route) => false,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: const BorderSide(color: Colors.grey),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text('Voltar para o Início'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
