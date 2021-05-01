import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  bool _isClick = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Navigator(
        pages: [
          MaterialPage(
              key: ValueKey('FirstPage'),
              child: Center(
                child: GestureDetector(
                  child: Text('first'),
                  onTap: () {
                    setState(() {
                      _isClick = true;
                    });
                  },
                ),
              )),
          if (_isClick == true) SecondScreen(),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
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
    );
  }
}

class SecondScreen extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return Center(
            child: Text('second page'),
          );
        });
  }
}
