import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Script3> _httpRequest() async {
  final url = Uri.http('foorty.eu', '/api/api_receipt/script_3_infomerchant.php');
  var responseRequest = await http.get(
    url,
  );
  final script3 = script3FromJson(responseRequest.body);
  //print('coucou');
  if (responseRequest.statusCode == 200) {
    //print(responseRequest.statusCode);
    if (script3.success) {
      return script3;

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
  late Future<Script3> _getResultFromHttprequest;
  @override
  void initState() {
    _getResultFromHttprequest = _httpRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Script3>(
      future: _getResultFromHttprequest,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12,
                                bottom: 12,
                              ),
                              child: Text(
                                "Informations entreprise",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 0.9 * 17,
                                  fontFamily: 'Satoshi',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                                bottom: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Company Name : '),
                                  Text(snapshot.data!.companyName),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                                bottom: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Company address : '),
                                  Text(snapshot.data!.companyAddress),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                                bottom: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Company city : '),
                                  Text('${snapshot.data!.zipCodeCompany} ${snapshot.data!.cityCompany}'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                                bottom: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Siret : '),
                                  Text(snapshot.data!.siret),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Points of sale list :",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 0.9 * 17,
                                fontFamily: 'Satoshi',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                const Text('Number of affiliated POS : '),
                                Text('${snapshot.data!.countPos.toString()} points of sale'),
                              ],
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.countPos,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("POS identifier : "),
                                          Text(snapshot.data!.pos[index].posId),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("POS Address : "),
                                          Text(snapshot.data!.pos[index].address),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("POS City : "),
                                          Text("${snapshot.data!.pos[index].posZipCode} - ${snapshot.data!.pos[index].posCity}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("POS Country : "),
                                          Text(snapshot.data!.pos[index].posCountry),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
Script3 script3FromJson(String str) => Script3.fromJson(json.decode(str));

String script3ToJson(Script3 data) => json.encode(data.toJson());

class Script3 {
  Script3({
    required this.success,
    required this.emailAdmin,
    required this.emailComptabilite,
    required this.companyName,
    required this.companyAddress,
    required this.zipCodeCompany,
    required this.cityCompany,
    required this.siret,
    required this.countPos,
    required this.pos,
  });

  bool success;
  String emailAdmin;
  String emailComptabilite;
  String companyName;
  String companyAddress;
  String zipCodeCompany;
  String cityCompany;
  String siret;
  int countPos;
  List<Po> pos;

  factory Script3.fromJson(Map<String, dynamic> json) => Script3(
    success: json["success"],
    emailAdmin: json["emailAdmin"],
    emailComptabilite: json["emailComptabilite"],
    companyName: json["companyName"],
    companyAddress: json["companyAddress"],
    zipCodeCompany: json["zipCodeCompany"],
    cityCompany: json["cityCompany"],
    siret: json["siret"],
    countPos: json["countPos"],
    pos: List<Po>.from(json["pos"].map((x) => Po.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "emailAdmin": emailAdmin,
    "emailComptabilite": emailComptabilite,
    "companyName": companyName,
    "companyAddress": companyAddress,
    "zipCodeCompany": zipCodeCompany,
    "cityCompany": cityCompany,
    "siret": siret,
    "countPos": countPos,
    "pos": List<dynamic>.from(pos.map((x) => x.toJson())),
  };
}

class Po {
  Po({
    required this.posId,
    required this.posName,
    required this.address,
    required this.posZipCode,
    required this.posCity,
    required this.posCountry,
  });

  String posId;
  String posName;
  String address;
  String posZipCode;
  String posCity;
  String posCountry;

  factory Po.fromJson(Map<String, dynamic> json) => Po(
    posId: json["posId"],
    posName: json["posName"],
    address: json["address"],
    posZipCode: json["posZipCode"] == null ? null : json["posZipCode"],
    posCity: json["posCity"],
    posCountry: json["posCountry"],
  );

  Map<String, dynamic> toJson() => {
    "posId": posId,
    "posName": posName,
    "address": address,
    "posZipCode": posZipCode == null ? null : posZipCode,
    "posCity": posCity,
    "posCountry": posCountry,
  };
}


