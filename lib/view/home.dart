import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Seu peso em vários planetas"),
        backgroundColor: const Color.fromRGBO(64, 16, 87, 1),
      ),
      backgroundColor: const Color.fromRGBO(128, 16, 166, 1),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'assets/galaxia.gif',
              height: 300,
              width: 200,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'O seu peso na Terra',
                        hintText: 'kg',
                        icon: Icon(Icons.person_2_outlined)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
==================Scaffold==================
O Scaffold é um widget que fornece uma estrutura básica que segue o padrão do MaterialDesign.
Possui elementos comuns, como: ma barra de aplicativo (AppBar) na parte superior, um corpo 
central onde você pode colocar seu conteúdo principal e, opcionalmente, uma barra de navegação
na parte inferior.

Exemplo
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Meu Aplicativo'),
      ),
      body: Center(
        child: Text('Olá, Flutter!'),
      ),
    ),
  ));
}

Neste exemplo, o Scaffold é utilizado como o corpo do aplicativo. Ele possui um appBar 
(AppBar) personalizado com o título "Meu Aplicativo" e um body (corpo) contendo um texto 
centralizado que exibe "Olá, Flutter!".

Creditos Gif: Yup Nguyen
link: https://dribbble.com/shots/3122527-MilkyWay-Animated
*/