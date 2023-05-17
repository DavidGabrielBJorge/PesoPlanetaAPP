import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? radioValor = 2;
  String _nomePlaneta = ""; //_ indica atributo privado

  void FormatarValorRadio(int? valor) {
    //Vai usar o setState para atualizar os widgets
    setState(() {
      radioValor = valor;

      switch (radioValor) {
        case 0:
          _nomePlaneta = "Planeta Plutão";
          debugPrint(_nomePlaneta);
          break;

        case 1:
          _nomePlaneta = "Planeta Marte";
          debugPrint(_nomePlaneta);
          break;

        case 2:
          _nomePlaneta = "Planeta Neturno";
          debugPrint(_nomePlaneta);
          break;

        default:
          debugPrint("Nada foi selecionado");
      }
    });
  }

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
                  ),
                  //Opções de planetas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValor,
                          onChanged:
                              FormatarValorRadio), //O radio button vai receber um int
                      Text(
                        "Plutão",
                        style: TextStyle(color: Colors.white),
                      ),
                      //Marte
                      Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValor,
                          onChanged: FormatarValorRadio),
                      Text(
                        "Marte",
                        style: TextStyle(color: Colors.white),
                      ),

                      //Neturno
                      Radio<int>(
                          activeColor: Colors.orange,
                          value: 2,
                          groupValue: radioValor,
                          onChanged: FormatarValorRadio),
                      Text(
                        "Neturno",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  //Mostrar resultado
                  Text("O meu peso....",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calcularPeso(String peso, double gravidade) {
    //Se peso não for um número vazio e maior que 0 deve fazer a lógica
    if (int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0) {
      return (int.parse(peso) * gravidade);
    } else {
      print("Número inválido");
      return int.parse("180") * 0.38;
      //Retorna um peso padrão
    }
    return 1;
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