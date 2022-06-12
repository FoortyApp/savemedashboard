import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:savemedashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{'/dashboard': (BuildContext context) => const MyDashBoard()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return widthScreen > 1000
        ? Scaffold(
            backgroundColor: const Color.fromRGBO(246, 244, 210, 1),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(25),
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
                            Text(
                              'Not a SaveMe user ? $widthScreen',
                              style: const TextStyle(
                                fontFamily: 'Chillax',
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                letterSpacing: -1,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
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
                                  'Try it free',
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300.0,
                  height: 450,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(79, 119, 45, 1),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(79, 119, 45, 1),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontFamily: 'ChillaxSB',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1,
                            color: Color.fromRGBO(236, 243, 158, 1),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 250,
                          height: 35,
                          color: const Color.fromRGBO(236, 243, 158, 1),
                          padding: const EdgeInsets.all(8.0),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              right: 8.0,
                              left: 8,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 250,
                          height: 35,
                          color: const Color.fromRGBO(
                            236,
                            243,
                            158,
                            1,
                          ),
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              right: 8.0,
                              left: 8,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/dashboard');
                          },
                          child: Container(
                            color: Colors.black,
                            width: 250,
                            height: 35,
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'ChillaxSB',
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          )
        : const Scaffold(
            body: Center(
              child: Text('petit'),
            ),
          );
  }
}
