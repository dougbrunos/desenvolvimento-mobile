import 'package:flutter/material.dart';

class Confirmacao extends StatelessWidget {
  final String nome;
  final String idade;
  final String email;
  final String sexo;
  final bool aceitoTermos;
  final TextEditingController nomeController;
  final TextEditingController idadeController;
  final TextEditingController emailController;
  final String? sexoSelecionado;
  final bool aceitoTermosState;
  final Function(String, String, String, String, bool) onEditar;

  const Confirmacao({
    super.key,
    required this.nome,
    required this.idade,
    required this.email,
    required this.sexo,
    required this.aceitoTermos,
    required this.nomeController,
    required this.idadeController,
    required this.emailController,
    required this.sexoSelecionado,
    required this.aceitoTermosState,
    required this.onEditar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Confirmação'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dados do Cadastro',
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                      ),
                      const SizedBox(height: 20),
                      _campoExibicao(context, 'Nome', nome),
                      const SizedBox(height: 16),
                      _campoExibicao(context, 'Idade', idade),
                      const SizedBox(height: 16),
                      _campoExibicao(context, 'Email', email),
                      const SizedBox(height: 16),
                      _campoExibicao(context, 'Sexo', sexo),
                      const SizedBox(height: 16),
                      _campoExibicao(context, 'Termos de Uso',
                          aceitoTermos ? 'Sim' : 'Não'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Voltar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          onEditar(nome, idade, email, sexo, aceitoTermos);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Editar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _campoExibicao(BuildContext context, String label, String valor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          valor,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

