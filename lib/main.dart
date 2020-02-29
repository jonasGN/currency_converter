import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:async/async.dart';
import 'dart:convert';

// api url
const baseURL = 'https://api.hgbrasil.com/finance?format=json&key=dbbf2f6c';

void main() async {
  Http.Response response = await Http.get(baseURL);
  print(json.decode(response.body)['results']['currencies']);

  var teste = json.decode(response.body)['results']['currencies']['USD']['buy'];

  runApp(MaterialApp(
    title: 'Conversor de moedas',
    home: Container(
      child: Text('$teste'),
    ),
  ));
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
