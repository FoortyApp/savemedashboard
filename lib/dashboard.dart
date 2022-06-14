import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:savemedashboard/main.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({Key? key}) : super(key: key);

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  late Future<Script1LogoutJson> _getResultFromHttprequest1;
  late Future<Script2ApiscreenJson> _getResultFromHttprequest999;
  int PushMenuButton = 1;
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

  Future<Script2ApiscreenJson> _httpRequest999() async {
    final url = Uri.http('foorty.eu', '/api/api_receipt/script_2_apiscreen.php');
    var responseRequest = await http.get(
      url,
    );
    final script2ApiscreenJson = script2ApiscreenJsonFromJson(responseRequest.body);

    if (responseRequest.statusCode == 200) {
      if (script2ApiscreenJson.success) {
        return script2ApiscreenJson;
      }
    } else {}
    throw Exception('Failed to load datas');
  }

  final String _titleSection = 'Bienvenue';
  @override
  void initState() {
    _getResultFromHttprequest1 = _httpRequest();
    _getResultFromHttprequest999 = _httpRequest999();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 246, 248, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(
                  image: AssetImage('assets/logo.png'),
                  width: 150,
                ),
                InkWell(
                  onTap: _httpRequest,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(79, 119, 45, 1),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            fontFamily: 'Chillax',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.ice_skating,
                                size: 15,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'My Account',
                                style: TextStyle(
                                  fontFamily: 'Chillax',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.ice_skating,
                                size: 15,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'My Account',
                                style: TextStyle(
                                  fontFamily: 'Chillax',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.ice_skating,
                                size: 15,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'My Account',
                                style: TextStyle(
                                  fontFamily: 'Chillax',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.settings_rounded,
                                size: 15,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Settings',
                                style: TextStyle(
                                  fontFamily: 'Chillax',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.group_rounded,
                                size: 15,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Mes clients',
                                style: TextStyle(
                                  fontFamily: 'Chillax',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16.0,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                PushMenuButton = 999;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.api_rounded,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'API Access',
                                  style: TextStyle(
                                    fontFamily: 'Chillax',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16.0,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                PushMenuButton = 1;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.logout_rounded,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Déconnexion',
                                  style: TextStyle(
                                    fontFamily: 'Chillax',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            PushMenuButton.toString(),
                            style: const TextStyle(
                              fontFamily: 'ChillaxSB',
                              fontSize: 0.9 * 25,
                              letterSpacing: -0.8,
                            ),
                          ),
                        ],
                      ),
                      Row(
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Client',
                                          style: TextStyle(
                                            letterSpacing: -0.8,
                                            fontSize: 0.9 * 17,
                                            fontFamily: 'ChillaxSB',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Nombre de\nvisites",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 0.9 * 17,
                                            fontFamily: 'Satoshi',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Panier moyen en \$",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 0.9 * 17,
                                            fontFamily: 'Satoshi',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Date de la\ndernière visite",
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      PushMenuButton == 1
                          ? Expanded(
                              child: PushMenuButton == 1
                                  ? FutureBuilder<Script1LogoutJson>(
                                      future: _getResultFromHttprequest1, // a previously-obtained Future<String> or null
                                      builder: (BuildContext context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text('${snapshot.data?.success}');
                                        }
                                        throw Exception('Failed to load datas');
                                      },
                                    )
                                  : Container())
                          : PushMenuButton == 999
                              ? FutureBuilder<Script2ApiscreenJson>(
                                  future: _getResultFromHttprequest999, // a previously-obtained Future<String> or null
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
                                                      children: [
                                                        const Text(
                                                          "Clé API",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 0.9 * 17,
                                                            fontFamily: 'Satoshi',
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 25,
                                                        ),
                                                        SelectableText(
                                                          '${snapshot.data?.apiKey}',
                                                          textAlign: TextAlign.center,
                                                          style: const TextStyle(
                                                            fontSize: 0.9 * 17,
                                                            fontFamily: 'Satoshi',
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
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
                                    throw Exception('Failed to load datas');
                                  },
                                )
                              : const Text('Coucou'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyListTile extends StatefulWidget {
  final int index;

  const _MyListTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<_MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<_MyListTile> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Julie Delpietro',
                  style: TextStyle(
                    letterSpacing: -0.8,
                    fontSize: 0.9 * 17,
                    fontFamily: 'ChillaxSB',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "12",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 0.9 * 17,
                    fontFamily: 'Satoshi',
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "24,78",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 0.9 * 17,
                    fontFamily: 'Satoshi',
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "12/06/2022",
                  style: TextStyle(
                    fontSize: 0.9 * 17,
                    fontFamily: 'Satoshi',
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

//Création d'une classe pour le traitement du JSON
Script2ApiscreenJson script2ApiscreenJsonFromJson(String str) => Script2ApiscreenJson.fromJson(json.decode(str));
String script2ApiscreenJsonToJson(Script2ApiscreenJson data) => json.encode(data.toJson());

class Script2ApiscreenJson {
  Script2ApiscreenJson({
    required this.success,
    required this.apiKey,
  });

  bool success;
  String apiKey;

  factory Script2ApiscreenJson.fromJson(Map<String, dynamic> json) => Script2ApiscreenJson(
        success: json["success"],
        apiKey: json["API Key"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "API Key": apiKey,
      };
}
