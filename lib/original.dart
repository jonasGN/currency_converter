import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// api url
const baseURL = 'https://api.hgbrasil.com/finance?format=json&key=dbbf2f6c';

void main() async {
  runApp(MaterialApp(
    title: 'Conversor de moedas',
    theme: ThemeData(
        // hintColor: Colors.white,
        // primaryColor: Colors.green,
        ),
    home: Home(),
  ));
}

// funcção futura responsável por fazer a requisição e retornar os dados da api
Future<Map> getData() async {
  http.Response response = await http.get(baseURL);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dollar;
  double euro;

  // controladores de textos editáveis
  final reaisController = TextEditingController();
  final dollarController = TextEditingController();
  final euroController = TextEditingController();

  //
  void _onChangedReais(String value) {
    double real = double.parse(value);
    dollarController.text = (real / dollar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _onChangedDollar(String value) {
    double dollar = double.parse(value);
    reaisController.text = (dollar * this.dollar).toStringAsFixed(2);
    euroController.text = ((dollar * this.dollar) / euro).toStringAsFixed(2);
  }

  void _onChangedEuro(String value) {
    double euro = double.parse(value);
    reaisController.text = (euro * this.euro).toStringAsFixed(2);
    dollarController.text = ((euro * this.euro) / dollar).toStringAsFixed(2);
  }

  Widget handleDataToRender(context, snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return InfoData('Carregando dados...');
      default:
        if (snapshot.hasError) {
          return InfoData('Erro ao carregar dados');
        } else {
          dollar = snapshot.data['results']['currencies']['USD']['buy'];
          euro = snapshot.data['results']['currencies']['EUR']['buy'];

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.account_balance,
                  size: 150,
                  color: Colors.green,
                ),
                CurrencyInput(
                  labelText: 'Reais',
                  controller: reaisController,
                  onChanged: _onChangedReais,
                ),
                CurrencyInput(
                  labelText: 'Dólar',
                  prefix: 'U\$',
                  controller: dollarController,
                  onChanged: _onChangedDollar,
                ),
                CurrencyInput(
                  labelText: 'Euro',
                  prefix: '€',
                  controller: euroController,
                  onChanged: _onChangedEuro,
                ),
              ],
            ),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Conversor'),
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        // o "builder" recebe dois parâmetros, sendo o "context" e o "snapshot"
        builder: handleDataToRender,
      ),
    );
  }
}

class InfoData extends StatelessWidget {
  final String title;

  InfoData(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Google',
          fontSize: 20,
        ),
      ),
    );
  }
}

class CurrencyInput extends StatelessWidget {
  final String labelText;
  final String inputText;
  final String prefix;
  final TextEditingController controller;
  final Function onChanged;

  CurrencyInput({
    this.inputText,
    this.labelText,
    this.prefix = 'R\$',
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: 'Google',
            color: Colors.green,
            fontSize: 18.0,
          ),
          prefixText: '$prefix ',
          // prefixStyle:
        ),
        onChanged: onChanged,
      ),
    );
  }
}
