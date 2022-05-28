import 'package:flutter/cupertino.dart';
import 'package:task_check/page/main/main.dart';
import './routes.dart';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Family App',
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Home'),
        ),
        child: new MainPage(),
      ),
      routes: routes,
    );
  }
}

