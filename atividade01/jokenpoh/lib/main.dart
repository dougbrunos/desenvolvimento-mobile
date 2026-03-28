import 'package:flutter/material.dart';
import 'package:jokenpoh/resultado.dart';

import 'Escolha.dart';

const String appName = 'Pedra, Papel, Tesoura';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void chamarTelaResultado(Escolha escolha) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Resultado(escolha),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        child: Column(
          children: [

            SizedBox(height: 40),

            Container(
              child: Image.asset('assets/img/padrao.png')
            ),

            SizedBox(height: 15),

            Text(
              "Escolha do APP",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 120),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                GestureDetector(
                  onTap: () {
                   chamarTelaResultado(pedra);
                  },
                  child: Container(
                    child: Image.asset(pedra.caminho),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    chamarTelaResultado(papel);
                  },
                  child: Container(
                    child: Image.asset(papel.caminho),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    chamarTelaResultado(tesoura);
                  },
                  child: Container(
                    child: Image.asset(tesoura.caminho),
                  ),
                )

              ],
            )

          ],
        ),
      )

    );
  }
}