import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

// hg Brasil convert API
const BASE_URL = 'https://api.hgbrasil.com/finance?format=json&key=dbbf2f6c';

Future<Map> getData() async {
  http.Response response = await http.get(BASE_URL);
  return json.decode(response.body);
}
