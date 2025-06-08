import 'package:flutter/material.dart';

class GradeCurricularScreen extends StatelessWidget {
  const GradeCurricularScreen({super.key});

  final Map<String, List<Map<String, String>>> matriz = const {
    "1º Período": [
      {"Código": "011001131", "Disciplina": "ALGORITMOS E PROGRAMAÇÃO I", "CH": "60"},
      {"Código": "011001132", "Disciplina": "ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES I", "CH": "60"},
      {"Código": "011001133", "Disciplina": "DESENVOLVIMENTO FRONT-END", "CH": "60"},
      {"Código": "011001134", "Disciplina": "INGLÊS INSTRUMENTAL", "CH": "60"},
      {"Código": "011001135", "Disciplina": "LEITURA E PRÁTICA DE PRODUÇÃO TEXTUAL", "CH": "60"},
    ],
    "2º Período": [
      {"Código": "011001136", "Disciplina": "PRÉ-CÁLCULO", "CH": "60"},
      {"Código": "011001137", "Disciplina": "GESTÃO DE PROCESSOS EMPRESARIAIS", "CH": "30"},
      {"Código": "011001138", "Disciplina": "LÓGICA MATEMÁTICA", "CH": "30"},
      {"Código": "011001139", "Disciplina": "ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES II", "CH": "60"},
      {"Código": "011001140", "Disciplina": "BANCO DE DADOS I", "CH": "60"},
      {"Código": "011001141", "Disciplina": "ALGORITMOS E PROGRAMAÇÃO II", "CH": "60"},
    ],
    "3º Período": [
      {"Código": "011001142", "Disciplina": "CÁLCULO DIFERENCIAL E INTEGRAL", "CH": "60"},
      {"Código": "011001143", "Disciplina": "METODOLOGIA CIENTÍFICA E DA PESQUISA", "CH": "30"},
      {"Código": "011001144", "Disciplina": "SOCIEDADE E TECNOLOGIA", "CH": "30"},
      {"Código": "011001145", "Disciplina": "ESTRUTURAS DE DADOS", "CH": "60"},
      {"Código": "011001146", "Disciplina": "TÓPICOS EM PROGRAMAÇÃO I", "CH": "60"},
      {"Código": "011001147", "Disciplina": "BANCO DE DADOS II", "CH": "60"},
      {"Código": "011001148", "Disciplina": "EMPREENDEDORISMO E INOVAÇÃO", "CH": "60"},
    ],
    "4º Período": [
      {"Código": "011001149", "Disciplina": "PROJETO INTEGRADOR I", "CH": "60"},
      {"Código": "011001150", "Disciplina": "FUNDAMENTOS DE SISTEMAS DE INFORMAÇÃO", "CH": "30"},
      {"Código": "011001151", "Disciplina": "ENGENHARIA DE REQUISITOS", "CH": "30"},
      {"Código": "011001152", "Disciplina": "ENGENHARIA DE SOFTWARE I", "CH": "60"},
      {"Código": "011001153", "Disciplina": "TÓPICOS EM PROGRAMAÇÃO II", "CH": "60"},
      {"Código": "011001154", "Disciplina": "SISTEMAS OPERACIONAIS", "CH": "60"},
      {"Código": "011001155", "Disciplina": "ASPECTOS TEÓRICOS DE COMPUTAÇÃO", "CH": "60"},
    ],
    "5º Período": [
      {"Código": "011001156", "Disciplina": "PROJETO INTEGRADOR II", "CH": "60"},
      {"Código": "011001157", "Disciplina": "GESTÃO ESTRATÉGICA DA INFORMAÇÃO", "CH": "30"},
      {"Código": "011001158", "Disciplina": "OTIMIZAÇÃO PARA SISTEMAS", "CH": "30"},
      {"Código": "011001159", "Disciplina": "ENGENHARIA DE SOFTWARE II", "CH": "60"},
      {"Código": "011001160", "Disciplina": "COMPUTAÇÃO ORIENTADA A SERVIÇOS", "CH": "60"},
      {"Código": "011001161", "Disciplina": "REDES DE COMPUTADORES I", "CH": "60"},
      {"Código": "011001162", "Disciplina": "TÓPICOS EM PROGRAMAÇÃO III", "CH": "60"},
    ],
    "6º Período": [
      {"Código": "011001163", "Disciplina": "ESTÁGIO SUPERVISIONADO", "CH": "60"},
      {"Código": "011001164", "Disciplina": "INTERFACE HUMANO- COMPUTADOR", "CH": "60"},
      {"Código": "011001165", "Disciplina": "GOVERNANÇA DE TI", "CH": "30"},
      {"Código": "011001166", "Disciplina": "ENGENHARIA DE QUALIDADE", "CH": "30"},
      {"Código": "011001167", "Disciplina": "ESTATÍSTICA COMPUTACIONAL", "CH": "60"},
      {"Código": "011001168", "Disciplina": "INTELIGÊNCIA ARTIFICIAL", "CH": "60"},
      {"Código": "011001169", "Disciplina": "REDES DE COMPUTADORES II", "CH": "60"},
      {"Código": "011001170", "Disciplina": "PROGRAMAÇÃO PARA DISPOSITIVOS MÓVEIS I", "CH": "60"},
    ],
    "7º Período": [
      {"Código": "011001171", "Disciplina": "ELABORAÇÃO E GESTÃO DE PROJETOS", "CH": "60"},
      {"Código": "011001172", "Disciplina": "SISTEMAS DISTRIBUÍDOS", "CH": "60"},
      {"Código": "011001173", "Disciplina": "MINERAÇÃO DE DADOS", "CH": "60"},
      {"Código": "011001174", "Disciplina": "PROGRAMAÇÃO PARA DISPOSITIVOS MÓVEIS II", "CH": "60"},
      {"Código": "011001175", "Disciplina": "TRABALHO DE CONCLUSÃO DE CURSO I", "CH": "60"},
    ],
    "8º Período": [
      {"Código": "011001176", "Disciplina": "SEGURANÇA E AUDITORIA DE SISTEMAS", "CH": "60"},
      {"Código": "011001177", "Disciplina": "DIREITO E LEGISLAÇÃO EM INFORMÁTICA", "CH": "60"},
      {"Código": "011001178", "Disciplina": "SIMULAÇÃO DE SISTEMAS DE INFORMAÇÃO", "CH": "60"},
      {"Código": "011001179", "Disciplina": "INFRAESTRUTURA DE REDES COMO SERVIÇOS", "CH": "60"},
      {"Código": "011001180", "Disciplina": "TRABALHO DE CONCLUSÃO DE CURSO II", "CH": "60"},
    ],
    "Optativas": [
      {"Código": "011001181", "Disciplina": "TÓPICOS ESPECIAIS EM METODOLOGIA DE PROJETO DE PESQUISA", "CH": "60"},
      {"Código": "011001182", "Disciplina": "TÓPICOS ESPECIAIS EM ACESSIBILIDADE E USABILIDADE", "CH": "60"},
      {"Código": "011001183", "Disciplina": "LIBRAS", "CH": "60"},
      {"Código": "011001184", "Disciplina": "TÓPICOS ESPECIAIS EM SISTEMAS DE RECOMENDAÇÃO", "CH": "60"},
      {"Código": "011001185", "Disciplina": "TÓPICOS ESPECIAIS EM SISTEMAS DE INFORMAÇÃO", "CH": "60"},
      {"Código": "011001186", "Disciplina": "TÓPICOS ESPECIAIS EM COMPUTAÇÃO", "CH": "60"},
      {"Código": "011001187", "Disciplina": "TÓPICOS ESPECIAIS EM ENGENHARIA DE SOFTWARE", "CH": "60"},
      {"Código": "011001188", "Disciplina": "TÓPICOS ESPECIAIS EM PROGRAMAÇÃO", "CH": "60"},
      {"Código": "011001189", "Disciplina": "TÓPICOS ESPECIAIS EM REDES DE COMPUTADORES", "CH": "60"},
      {"Código": "011001190", "Disciplina": "TÓPICOS ESPECIAIS EM COMPUTAÇÃO GRÁFICA", "CH": "60"},
      {"Código": "011001191", "Disciplina": "TÓPICOS ESPECIAIS EM BANCO DE DADOS", "CH": "60"},
      {"Código": "011001192", "Disciplina": "TÓPICOS ESPECIAIS EM AMBIENTES WEB", "CH": "60"},
      {"Código": "011001193", "Disciplina": "TÓPICOS ESPECIAIS EM INTELIGÊNCIA ARTIFICIAL", "CH": "60"},
      {"Código": "011001195", "Disciplina": "PSICOLOGIA APLICADA A SISTEMAS DE INFORMAÇÃO", "CH": "60"},
      {"Código": "011001196", "Disciplina": "INGLÊS PARA FINS ACADÊMICOS", "CH": "60"},
      {"Código": "011001197", "Disciplina": "POLÍTICAS DE EDUCAÇÃO EM DIREITOS HUMANOS", "CH": "60"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matriz Curricular - SISTEMAS DE INFORMAÇÃO'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...matriz.entries.map((entry) {
                  final periodo = entry.key;
                  final disciplinas = entry.value;

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          periodo,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF174EA6),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: DataTable(
                            headingRowColor: MaterialStateColor.resolveWith((states) => Color(0xFFDCDCDC)),
                            headingTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            dataTextStyle: const TextStyle(
                              color: Colors.black87,
                            ),
                            columnSpacing: 16.0,
                            dataRowMinHeight: 40,
                            dataRowMaxHeight: 50,
                            dividerThickness: 0.5,
                            showBottomBorder: false,
                            columns: const [
                              DataColumn(label: Expanded(child: Text("Código"))),
                              DataColumn(label: Expanded(child: Text("Disciplina"))),
                              DataColumn(label: Expanded(child: Text("CH"))),
                            ],
                            rows: disciplinas.map((disciplina) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    SizedBox(
                                      width: constraints.maxWidth * 0.2,
                                      child: Text(disciplina["Código"]!),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: constraints.maxWidth * 0.6,
                                      child: Text(disciplina["Disciplina"]!),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: constraints.maxWidth * 0.15,
                                      child: Text(disciplina["CH"]!),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
