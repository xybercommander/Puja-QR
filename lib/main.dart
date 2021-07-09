import 'package:flutter/material.dart';
import 'package:qr_code_app/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffFF7129),
        accentColor: Color(0xff2F2F2B),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Nunito-SemiBold'
      ),
      home: HomePage(),
    );
  }
}