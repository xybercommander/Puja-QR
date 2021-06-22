import 'package:flutter/material.dart';

class Scanner extends StatefulWidget {
  const Scanner({ Key key }) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Scanner Page'),
      ),
    );
  }
}