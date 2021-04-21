import 'package:flutter/material.dart';
import 'package:project/routes.dart';

import 'package:project/screens/Project_Home/project_home_screen.dart';
import 'package:project/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: ProjectHomeScreen.routeName,
      routes: routes,
    );
  }
}
