import 'package:flutter/material.dart';
import 'package:jokenpoh/main.dart';

const String appName = 'Pedra, Papel, Tesoura';

class Resultado extends StatefulWidget {
  const Resultado({super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            appName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),

        body:  Center(
          child: Container(
            child: Column(
              children: [

                SizedBox(height: 40),

                Container(
                    child: Image.asset('assets/img/papel.png')
                ),

                SizedBox(height: 15),

                Text(
                  "Escolha do APP",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Container(
                    child: Image.asset('assets/img/pedra.png')
                ),

                SizedBox(height: 15),

                Text(
                  "Escolha do APP",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Container(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    'assets/img/icons8-perder-48.png',
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  "Escolha do APP",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(title: appName),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Jogar novamente",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        )


    );
  }
}
