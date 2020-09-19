import 'package:digitisation/model/bottom_navbar.dart';
import 'package:flutter/material.dart';

int _currentIndex = 2;

class QRandBARCode extends StatefulWidget {
  @override
  _QRandBARCodeState createState() => _QRandBARCodeState();
}

class _QRandBARCodeState extends State<QRandBARCode>
    with SingleTickerProviderStateMixin {
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
        title: new Text(
          "Digitisation",
          style: TextStyle(
              fontFamily: 'KumbhSans',
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          indicatorWeight: 5.0,
          labelColor: Colors.deepPurple,
          tabs: [
            new Tab(
                icon: new Icon(
              Icons.qr_code_scanner,
              size: 40.0,
            )),
            new Tab(
              icon: new Icon(
                Icons.scanner_outlined,
                size: 40.0,
              ),
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          Text("This is  QR Tab View"),
          Text("This is  BarCode Tab View"),
        ],
        controller: _tabController,
      ),
    );
  }
}
