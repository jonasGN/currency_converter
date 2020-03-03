import 'package:conversor_moedas/components/ConverterSection.dart';
import 'package:conversor_moedas/components/MainCard.dart';
import 'package:conversor_moedas/layout/colors.dart';
import 'package:conversor_moedas/services/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Conversor de moedas',
    home: Home(),
    theme: ThemeData(fontFamily: 'Poppins'),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dollar;
  double euro;

  // text controllers
  final reaisController = TextEditingController();
  final dollarController = TextEditingController();
  final euroController = TextEditingController();

  //
  void _onChangedReais(String text) {
    double reais = double.parse(text);
    dollarController.text = (reais / dollar).toStringAsFixed(2);
    euroController.text = (reais / euro).toStringAsFixed(2);
  }

  //
  void _onChangedDollar(String text) {
    double dollar = double.parse(text);
    reaisController.text = (dollar * this.dollar).toStringAsFixed(2);
    euroController.text = ((dollar * this.dollar) / euro).toStringAsFixed(2);
  }

  //
  void _onChangedEuro(String text) {
    double euro = double.parse(text);
    reaisController.text = (euro * this.euro).toStringAsFixed(2);
    dollarController.text = ((euro * this.euro) / dollar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.PAGE_BACKGROUND,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Conversor monetário',
          style: TextStyle(
            color: MyColors.BLACK,
            fontSize: 20, // [font]
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
                color: MyColors.BLACK,
                size: 24,
              ),
              onPressed: null),
        ],
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Container(
                  height: 50,
                  width: 50,
                  color: Colors.amber,
                );
              default:
                if (snapshot.hasError) {
                  return Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  );
                } else {
                  dollar = snapshot.data['results']['currencies']['USD']['buy'];
                  euro = snapshot.data['results']['currencies']['EUR']['buy'];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        MainCard(
                          controller: dollarController,
                          onChanged: _onChangedDollar,
                          prefix: 'U\$',
                        ),
                        ConverterSection(),
                        MainCard(
                          controller: reaisController,
                          onChanged: _onChangedReais,
                          prefix: 'R\$',
                          isBackground: true,
                        ),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}
