import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({Key? key}) : super(key: key);

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  get http => null;


  void _HttpRequest() async {
    final postParameters = {
      "uuid": "12345667889"
    };

    var jsonParameters = jsonEncode(postParameters);
    //print(jsonParameters);
    final url = Uri.http('foorty.eu','/testo');
    print(url);
    var responseRequest = await http.post(url, body: jsonParameters);
    //final quotationResponse = quotationResponseFromJson(responseRequest.body);
    if (responseRequest.statusCode == 200){

    }
  }
  String _titleSection = 'Bienvenue';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Padding(
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
                            bottom: 8.0,
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
                            bottom: 8.0,
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
                            bottom: 8.0,
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
                            bottom: 8.0,
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
                            bottom: 8.0,
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
                            bottom: 8.0,
                          ),
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
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                          ),
                          child: InkWell(
                            onTap: _HttpRequest,
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _titleSection,
                            style: const TextStyle(
                              fontFamily: 'ChillaxSB',
                              fontSize: 0.9 * 25,
                              letterSpacing: -0.8,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: false,
                          itemCount: 29,
                          itemBuilder: (context, index) {
                            return _MyListTile(index: index);
                          },
                        ),
                      ),
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

class Domain {
  String host = 'http://foorty.eu';
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
            title: const Text(
              'assets/img/apple.svg',
              style: TextStyle(
                letterSpacing: -0.8,
                fontSize: 0.9 * 17,
                fontFamily: 'ChillaxSB',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Transaction date : ",
                      style: TextStyle(
                        fontSize: 0.9 * 17,
                        fontFamily: 'Satoshi',
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "2022-06-12",
                      style: TextStyle(
                        fontSize: 0.9 * 17,
                        fontFamily: 'Satoshi',
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Price : ",
                      style: TextStyle(
                        fontSize: 0.9 * 17,
                        fontFamily: 'Satoshi',
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "12,23 \$",
                      style: TextStyle(
                        fontSize: 0.9 * 17,
                        fontFamily: 'Satoshi',
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
