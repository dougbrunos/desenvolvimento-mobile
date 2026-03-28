import 'dart:math';
import 'package:flutter/material.dart';
import 'Escolha.dart';

const String appName = 'Pedra, Papel, Tesoura';

class Resultado extends StatefulWidget {
  final Escolha escolhaUsuario;

  const Resultado(this.escolhaUsuario, {super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {

  late Escolha escolhaApp;
  late String mensagem;
  late String imagemResultado;

  @override
  void initState() {
    super.initState();
    escolhaApp = gerarJogadaApp();
    calcularResultado();
  }

  Escolha gerarJogadaApp() {
    final opcoes = [pedra, papel, tesoura];
    return opcoes[Random().nextInt(3)];
  }

  void calcularResultado() {
    String usuario = widget.escolhaUsuario.nome;
    String app = escolhaApp.nome;

    if (usuario == app) {
      mensagem = "Empate!";
      imagemResultado = "assets/img/icons8-aperto-de-mãos-100.png";
    } else if (
    (usuario == "Pedra" && app == "Tesoura") ||
        (usuario == "Tesoura" && app == "Papel") ||
        (usuario == "Papel" && app == "Pedra")
    ) {
      mensagem = "Você ganhou!";
      imagemResultado = "assets/img/icons8-vitória-48.png";
    } else {
      mensagem = "Você perdeu!";
      imagemResultado = "assets/img/icons8-perder-48.png";
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          appName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [

                const SizedBox(height: 40),

                Image.asset(escolhaApp.caminho, height: 120),

                const SizedBox(height: 15),

                const Text(
                  "Escolha do APP",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 40),

                Image.asset(widget.escolhaUsuario.caminho, height: 120),

                const SizedBox(height: 15),

                const Text(
                  "Sua escolha",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 40),

                Image.asset(imagemResultado, height: 120),

                const SizedBox(height: 15),

                Text(
                  mensagem,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 40),

                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Jogar novamente",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        )

    );
  }
}