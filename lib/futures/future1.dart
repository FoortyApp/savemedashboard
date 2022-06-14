import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Script1LogoutJson> _httpRequest() async {
  final url = Uri.http('foorty.eu', '/api/api_receipt/script_1_logout.php');
  print(url);
  var responseRequest = await http.get(
    url,
  );
  final script1LogoutJson = script1LogoutJsonFromJson(responseRequest.body);

  if (responseRequest.statusCode == 200) {
    if (script1LogoutJson.success) {
      return script1LogoutJson;
    }
  } else {}
  throw Exception('Failed to load datas');
}


class Future1 extends StatefulWidget{
  const Future1({Key? key}) : super(key: key);

  @override
  State<Future1> createState() => _Future1State();
}

class _Future1State extends State<Future1> {
  late Future<Script1LogoutJson> _getResultFromHttprequest1;
  @override
  void initState() {
    _getResultFromHttprequest1 = _httpRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Script1LogoutJson>(
      future: _getResultFromHttprequest1, // a previously-obtained Future<String> or null
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Text('${snapshot.data?.success}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

//Création d'une classe pour le traitement du JSON
Script1LogoutJson script1LogoutJsonFromJson(String str) => Script1LogoutJson.fromJson(json.decode(str));
String script1LogoutJsonToJson(Script1LogoutJson data) => json.encode(data.toJson());

class Script1LogoutJson {
  Script1LogoutJson({
    required this.success,
  });

  bool success;

  factory Script1LogoutJson.fromJson(Map<String, dynamic> json) => Script1LogoutJson(
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
  };
}