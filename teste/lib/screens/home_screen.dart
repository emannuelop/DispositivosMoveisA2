import 'package:flutter/material.dart';
import '../widgets/home_card.dart';
import 'relatorio_boletim_screen.dart';
import 'grade_curricular_screen.dart';
import 'rematricula_final_screen.dart';
import 'situacao_academica_screen.dart';
import 'analise_curricular_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Secretaria',
          style: TextStyle(
            color: Color(0xFF174EA6),
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF174EA6)),
      ),
      body: ListView(
        children: [
          HomeCard(
            title: 'BOLETIM (SEMESTRE ATUAL)',
            description: 'Desempenho nas disciplinas do semestre atual',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RelatorioBoletimScreen())),
          ),
          HomeCard(
            title: 'GRADE CURRICULAR',
            description: 'Veja as disciplinas distribuídas por período',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GradeCurricularScreen())),
          ),
          HomeCard(
            title: 'REMATRÍCULA ONLINE',
            description: 'Refaça sua matrícula conforme calendário acadêmico',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RematriculaFinalScreen())),
          ),
          HomeCard(
            title: 'SITUAÇÃO ACADÊMICA',
            description: 'Verifique sua situação acadêmica atual',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SituacaoAcademicaScreen())),
          ),
          HomeCard(
            title: 'ANÁLISE CURRICULAR',
            description: 'Análise curricular completa',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AnaliseCurricularScreen())),
          ),
        ],
      ),
    );
  }
}

