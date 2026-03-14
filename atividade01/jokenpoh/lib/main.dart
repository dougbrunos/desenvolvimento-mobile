import 'package:flutter/material.dart';
import 'package:jokenpoh/resultado.dart';

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
  int _counter = 0;

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Resultado(),
                      ),
                    );
                  },
                  child: Container(
                    child: Image.asset('assets/img/pedra.png'),
                  ),
                ),

                GestureDetector(
                  child: Container(
                    child: Image.asset('assets/img/papel.png'),
                  ),
                ),

                GestureDetector(
                  child: Container(
                    child: Image.asset('assets/img/tesoura.png'),
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