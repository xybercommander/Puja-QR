import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_app/models/search_model.dart';
import 'package:qr_code_app/services/mock_google_service.dart';

class QrDataPage extends StatefulWidget {
  final String uuid;
  const QrDataPage({Key key, this.uuid}) : super(key: key);

  @override
  _QrDataPageState createState() => _QrDataPageState();
}

class _QrDataPageState extends State<QrDataPage> {
  Map<String, dynamic> result;

  searchData() async {
    SearchForm searchForm = SearchForm(uuid: widget.uuid);
    Map<String, dynamic> data =
        await MockGoogleService().searchData(searchForm);

    setState(() {
      result = data;
    });
    print(result);
  }

  @override
  void initState() {
    super.initState();
    searchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      ),

      body: result != null 
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${result['name']}',
                    style: TextStyle(
                      fontFamily: 'Nunito-Black',
                      fontSize: 24
                    ),
                  ),
                  SizedBox(height: 32,),
                  Text(
                    'Puja Date: ${result['date']}',
                    style: TextStyle(
                      fontFamily: 'Nunito-Black',
                      fontSize: 24
                    ),
                  ),
                  SizedBox(height: 32,),
                  Text(
                    'Event: ${result['event']}',
                    style: TextStyle(
                      fontFamily: 'Nunito-Black',
                      fontSize: 24
                    ),
                  ),
                ],
              ),
        ) 
        : Center(
            child: Lottie.asset('assets/animations/searching-animation.json'),
          )
    );
  }
}
