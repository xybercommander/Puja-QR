import 'dart:io';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_app/models/feedback_model.dart';
import 'package:qr_code_app/services/mock_google_service.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:share/share.dart';
import 'package:share_extend/share_extend.dart';
import 'package:uuid/uuid.dart';

class QRCodePage extends StatefulWidget {
  final String name;
  final String pujaDate;
  final String event;

  const QRCodePage({ 
    Key key, 
    @required this.name, 
    @required this.pujaDate, 
    @required this.event 
  }) : super(key: key);

  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {

  // ignore: avoid_init_to_null
  String recievedUuid = null;
  var uuid = Uuid(); 
  ScreenshotController screenshotController = ScreenshotController();
  File imageFile;


  void submitForm() async {
    String generatedUuid = uuid.v4();

    FeedbackForm feedbackForm = FeedbackForm(
      id: generatedUuid,
      name: widget.name,
      date: widget.pujaDate,
      event: widget.event            ,
    );

    String result = await MockGoogleService().submitForm(feedbackForm);
    if(result == 'SUCCESS') {
      setState(() {
        recievedUuid = generatedUuid;        
      });      
    }
  }



  @override
  void initState() {
    super.initState();
    submitForm();
  }


  //--------------- UI ---------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      ),

      body: Container(
        padding: EdgeInsets.only(left: 36, top: 0, right: 36, bottom: 140),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${widget.name}\'s QR Code',
              style: TextStyle(
                fontFamily: 'Nunito-Black',
                fontSize: 24
              ),
            ),
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(40)
              ),
              child: Center(
                child: Screenshot(
                  controller: screenshotController,
                  child: Container(
                    width: 255,
                    height: 255,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: qrImage(),
                    ),
                  ),
                ),
              ),
            ),
            Container(                    
              height: 55,
              child: RawMaterialButton(     
                elevation: 0,               
                fillColor: Theme.of(context).primaryColor,
                shape: StadiumBorder(),
                onPressed: () async {
                  final imageFile = await screenshotController.capture(
                    path: '/data/user/0/com.example.qr_code_app/app_flutter/'
                  );
                  print(imageFile.path);
                  // ShareExtend.share(imageFile.path, 'image/png');
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,                          
                        ),
                      ),
                      Icon(Icons.share_outlined, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            Container(                    
              height: 55,
              child: RawMaterialButton(     
                elevation: 0,                               
                shape: StadiumBorder(side: BorderSide(width: 4, color: Theme.of(context).primaryColor)),
                onPressed: () {
                  print('Pop Button');
                  Navigator.pop(context);                
                },
                child: Center(
                  child: Text(
                    'Go Back',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,                          
                    ),
                  ),
                ),
              ),
            ),
            // imageFile != null ? Container(
            //   height: 50,
            //   width: 50,
            //   child: Image.file(imageFile),
            // ) : Container()
          ],
        ),
      )
    );
  }


  Widget qrImage() {
    return recievedUuid != null 
      ? QrImage(
        data: recievedUuid,
        version: QrVersions.auto,
        size: 215,
        gapless: false,          
      ) 
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/qr-code-loading.json', height: 100, width: 100),
          SizedBox(height: 4,),
          Text('Generating', style: TextStyle(fontSize: 18),)
        ],
      );
  }
}