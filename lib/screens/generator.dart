import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_app/screens/qr_code_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generator extends StatefulWidget {
  const Generator({ Key key }) : super(key: key);

  @override
  _GeneratorState createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _eventController = TextEditingController();

  List<String> pujaDates = ['Shashti', 'Saptami', 'Ashtami', 'Nabami', 'Dashami'];
  List<String> events = ['Lunch', 'Dinner'];

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool nameCheck = false;
  bool dateCheck = false;
  bool eventCheck = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,      
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.symmetric(vertical: 80),
        color: Theme.of(context).accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              child: Row(                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Generate a\nnew QR Code',
                    style: TextStyle(
                      fontFamily: 'Nunito-Black',
                      color: Colors.white,
                      fontSize: 32
                    ),
                  ),
                  Image.asset('assets/images/qr icon.png')
                ],
              ),
            ),
            SizedBox(height: 72,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 48),
              height: MediaQuery.of(context).size.height / 1.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter the Details', 
                    style: TextStyle(
                      fontSize: 32, 
                      fontFamily: 'Nunito-Black',
                      color: Theme.of(context).accentColor
                    ),
                  ),
                  // SizedBox(height: 16,),
                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,              
                        cursorColor: Colors.grey,
                        onChanged: (input) {
                          if(input.isNotEmpty) {
                            setState(() {
                              nameCheck = true;
                            });
                          } else {
                            setState(() {
                              nameCheck = false;
                            });
                          }
                        },                        
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none                
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 16,),
                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: DropdownButtonFormField(                
                        items: pujaDates.map((String pujaDate) {
                          return DropdownMenuItem(
                            value: pujaDate,
                            child: Text(pujaDate),
                          );
                        }).toList(),                        
                        onChanged: (value) {
                          setState(() {
                            _dateController.text = value;
                          });
                          if(value.isNotEmpty) {
                            setState(() {
                              dateCheck = true;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Puja Date',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none                
                        ),
                      ),
                    )
                  ),
                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: DropdownButtonFormField(                                        
                        items: events.map((String event) {
                          return DropdownMenuItem(
                            value: event,
                            child: Text(event),
                          );
                        }).toList(),                        
                        onChanged: (value) {
                          setState(() {
                            _eventController.text = value;
                          });
                          if(value.isNotEmpty) {
                            setState(() {
                              eventCheck = true;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Event',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none                
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 16,),                  
                  Container(                    
                    height: 55,
                    child: RawMaterialButton(     
                      elevation: 0,               
                      fillColor: nameCheck && dateCheck && eventCheck
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      shape: StadiumBorder(),
                      onPressed: () {
                        if (nameCheck && dateCheck && eventCheck) {
                          print('Generating');
                        
                          Navigator.push(context, PageTransition(
                            child: QRCodePage(
                              name: _nameController.text,
                              pujaDate: _dateController.text,
                              event: _eventController.text,
                            ), 
                            type: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 150)
                          ));

                          setState(() {
                            _nameController.text = '';
                            // _dateController.text = '';
                            // _eventController.text = '';
                            nameCheck = false;
                            // dateCheck = false;
                            // eventCheck = false;
                          });
                        }                        
                      },
                      child: Center(
                        child: Text(
                          'Generate',
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
          ],
        ),
      )
    );
  }
}