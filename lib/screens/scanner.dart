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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),              
              child: Text(
                'Scan a \nQR Code',
                style: TextStyle(
                  fontFamily: 'Nunito-Black',
                  color: Theme.of(context).accentColor,
                  fontSize: 32
                ),
              ),
            ),
            Center(
              child: Image.asset('assets/images/qr_scan_image.png'),
            ),
            Container(                    
              height: 55,
              child: RawMaterialButton(     
                elevation: 0,               
                fillColor: Theme.of(context).primaryColor,
                shape: StadiumBorder(),
                onPressed: () {

                },
                child: Center(
                  child: Text(
                    'Scan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,                          
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}