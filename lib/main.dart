import 'package:flutter/material.dart';
import 'package:app_portal/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorBrightness: Brightness.light
      ),
      title: 'Corralon Portal SAS',
      home: LoginPage(),
    );
  }
}