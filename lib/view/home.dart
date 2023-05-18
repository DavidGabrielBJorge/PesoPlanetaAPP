import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controlePeso = TextEditingController();
  int? radioValor = 0;
  String _nomePlaneta = ""; //_ indica atributo privado
/*
  //Teste de booleanos
  bool selecaoOpcao1 = true;
  bool selecaoOpcao2 = false;
  bool selecaoOpcao3 = false;
  bool switchValor = false;
*/
  double _resultadoFinal = 0.0;

  void formatarValorRadio(int? valor) {
    //Vai usar o setState para atualizar os widgets
    setState(() {
      radioValor = valor;

      switch (radioValor) {
        case 0:
          _resultadoFinal = calcularPeso(_controlePeso.text, 0.06);
          _nomePlaneta =
              "O seu peso em Plutão é  ${_resultadoFinal.toStringAsFixed(1)} Kg";
          break;

        case 1:
          _resultadoFinal = calcularPeso(_controlePeso.text, 0.38);
          _nomePlaneta =
              "O seu peso em Marte é  ${_resultadoFinal.toStringAsFixed(1)} Kg";
          break;

        case 2:
          _resultadoFinal = calcularPeso(_controlePeso.text, 1.19);
          _nomePlaneta =
              "O seu peso em Neturno é  ${_resultadoFinal.toStringAsFixed(1)} Kg"; //toStringAsFixed(1) vai mostrar em uma casa decimal
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
        title: const Text("Seu peso em vários planetas"),
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
                    controller: _controlePeso,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'O seu peso na Terra',
                        hintText: 'kg',
                        icon: Icon(Icons.person_2_outlined)),
                  ),
                  //Opções de planetas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Plutão
                      Radio<int>(
                          activeColor: Colors.grey.shade700,
                          value: 0,
                          groupValue: radioValor,
                          onChanged:
                              formatarValorRadio), //O radio button vai receber um int
                      const Text(
                        "Plutão",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      //Marte
                      Radio<int>(
                          activeColor: Colors.red.shade600,
                          value: 1,
                          groupValue: radioValor,
                          onChanged: formatarValorRadio),
                      const Text(
                        "Marte",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),

                      //Neturno
                      Radio<int>(
                          activeColor: Colors.blue.shade700,
                          value: 2,
                          groupValue: radioValor,
                          onChanged: formatarValorRadio),
                      const Text(
                        "Neturno",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  //Mostrar resultado
                  Text(
                      _controlePeso.text.isEmpty
                          ? "Digite o seu peso"
                          : _nomePlaneta,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
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
      //print("Número inválido");
      return int.parse("180") * 0.38;
      //Retorna um peso padrão
    }
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