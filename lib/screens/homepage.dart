import 'package:flutter/material.dart';
import 'package:qr_code_app/screens/generator.dart';
import 'package:qr_code_app/screens/scanner.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [Generator(), Scanner()];
  PageController pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, 
      // appBar: AppBar(
      //   title: Text("Qr Code App", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),

      body: PageView(
        controller: pageController,        
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Theme.of(context).primaryColor,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
            pageController.animateToPage(_selectedIndex,
                duration: Duration(milliseconds: 300),
                curve: Curves.linearToEaseOut);
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Generator' 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Scanner' 
          ),
        ]
      ),
    );
  }
}