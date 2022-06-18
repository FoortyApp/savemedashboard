import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Script4> _httpRequestFuture3() async {
  final url = Uri.http('foorty.eu', '/api/api_receipt/script_4_infocustomers.php');
  var responseRequest = await http.get(
    url,
  );
  final script4 = script4FromJson(responseRequest.body);

  if (responseRequest.statusCode == 200) {
    //print(responseRequest.statusCode);
    if (script4.success) {
      return script4;
    }
  } else {
    //print(responseRequest.statusCode);
  }
  throw Exception('Failed to load datas');
}

class Future3 extends StatefulWidget {
  const Future3({Key? key}) : super(key: key);

  @override
  State<Future3> createState() => _Future3State();
}

class _Future3State extends State<Future3> {
  late Future<Script4> _getResultFromHttprequest;
  @override
  void initState() {
    _getResultFromHttprequest = _httpRequestFuture3();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Script4>(
      future: _getResultFromHttprequest,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.countClients,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return ListTile(
                title: Text(snapshot.data!.clients[index].clientFirstName),
              );

            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 1,
            color: Colors.black,
          ),
        );
      },
    );
  }
}

//Création d'une classe pour le traitement du JSON

Script4 script4FromJson(String str) => Script4.fromJson(json.decode(str));
String script4ToJson(Script4 data) => json.encode(data.toJson());

class Script4 {
  Script4({
    required this.success,
    required this.countClients,
    required this.clients,
  });

  bool success;
  int countClients;
  List<Client> clients;

  factory Script4.fromJson(Map<String, dynamic> json) => Script4(
        success: json["success"],
        countClients: json["countClients"],
        clients: List<Client>.from(json["clients"].map((x) => Client.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "countClients": countClients,
        "clients": List<dynamic>.from(clients.map((x) => x.toJson())),
      };
}

class Client {
  Client({
    required this.clientId,
    required this.clientFirstName,
    required this.clientLastName,
    required this.clientMail,
    required this.clientZipCode,
    required this.clientCity,
    required this.clientCountry,
    required this.clientVisitReccuring,
    required this.clientAverage,
  });

  String clientId;
  String clientFirstName;
  String clientLastName;
  String clientMail;
  String clientZipCode;
  String clientCity;
  String clientCountry;
  int clientVisitReccuring;
  String clientAverage;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        clientId: json["clientId"],
        clientFirstName: json["clientFirstName"],
        clientLastName: json["clientLastName"],
        clientMail: json["clientMail"],
        clientZipCode: json["clientZipCode"],
        clientCity: json["clientCity"],
        clientCountry: json["clientCountry"],
        clientVisitReccuring: json["clientVisitReccuring"],
        clientAverage: json["clientAverage"],
      );

  Map<String, dynamic> toJson() => {
        "clientId": clientId,
        "clientFirstName": clientFirstName,
        "clientLastName": clientLastName,
        "clientMail": clientMail,
        "clientZipCode": clientZipCode,
        "clientCity": clientCity,
        "clientCountry": clientCountry,
        "clientVisitReccuring": clientVisitReccuring,
        "clientAverage": clientAverage,
      };
}
