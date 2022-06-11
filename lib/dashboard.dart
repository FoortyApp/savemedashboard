import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({Key? key}) : super(key: key);

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Account',
                        style: TextStyle(
                          fontFamily: 'Chillax',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        'My Clients',
                        style: TextStyle(
                          fontFamily: 'Chillax',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        'My Marketing Actions',
                        style: TextStyle(
                          fontFamily: 'Chillax',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
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
                                ],
                              ),
                            ),
                          ],
                        ),
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

class _MyListTile extends StatefulWidget {
  int index;

  _MyListTile({
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
