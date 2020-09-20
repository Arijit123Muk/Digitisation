import 'package:digitisation/model/bottom_navbar.dart';
import 'package:digitisation/ui/pdf_scanner.dart';
import 'package:digitisation/ui/photo_ocr_ui.dart';
import 'package:flutter/material.dart';


int _currentIndex = 1;
class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomnav(_currentIndex, context),
      appBar: new AppBar(
        backgroundColor: Colors.purple[300],
        title: new Text("Digitisation",style: TextStyle(fontFamily: 'KumbhSans',fontSize: 30.0,fontWeight: FontWeight.bold),),
        centerTitle: true,
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          indicatorWeight: 5.0,
          labelColor: Colors.deepPurple,
          tabs: [
            new Tab(icon: new Icon(Icons.camera,size: 40.0,)),
            new Tab(
              icon: new Icon(Icons.scanner_outlined,size: 40.0,),
            ),

          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,),
        bottomOpacity: 1,
      ),
      body:TabBarView(
        children: [
          MyAppss(),
          OCRScreen(),
        ],
        controller: _tabController,),
    );
  }
}
