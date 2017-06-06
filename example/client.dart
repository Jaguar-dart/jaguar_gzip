library jaguar_mux.example.simple.client;

import 'dart:async';

import 'package:http/http.dart' as http;

const String kHostname = 'localhost';

const int kPort = 8080;

final http.Client _client = new http.Client();

Future<Null> printHttpClientResponse(http.Response resp) async {
  print('=========================');
  print("body:");
  print(resp.body);
  print("statusCode:");
  print(resp.statusCode);
  print("headers:");
  print(resp.headers);
  print('=========================');
}

Future<Null> execGetUser() async {
  String url = "http://$kHostname:$kPort/api/hello.txt";
  http.Response resp = await _client.get(url);

  printHttpClientResponse(resp);
}

Future<Null> execJson() async {
  String url = "http://$kHostname:$kPort/api/info";
  http.Response resp = await _client.get(url);

  printHttpClientResponse(resp);
}

main() async {
  await execGetUser();
  await execJson();
}
