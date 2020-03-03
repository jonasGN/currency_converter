import 'package:conversor_moedas/components/ConverterSection.dart';
import 'package:conversor_moedas/components/MainCard.dart';
import 'package:flutter/material.dart';
// import './services/api.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FAFB), // [pageBackground]
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Conversor monetário',
          style: TextStyle(
            color: Color(0xff757F8C), // [black]
            fontSize: 20, // [font]
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Color(0xff757F8C), // [black]
                size: 24,
              ),
              onPressed: null),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            MainCard(),
            ConverterSection(),
            MainCard(),
          ],
        ),
      ),
    );
  }
}
