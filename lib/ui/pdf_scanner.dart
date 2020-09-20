import 'package:flutter/material.dart';
import 'package:flutter_genius_scan/flutter_genius_scan.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';

class MyAppss extends StatefulWidget {
  @override
  _MyAppssState createState() => _MyAppssState();
}

class _MyAppssState extends State<MyAppss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            'Doc Scan',
            style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 20.0,left:MediaQuery.of(context).size.width *.68,right: 10.0 ),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.camera_alt),
            label: Text("Scan"),
              onPressed: () async{
                await FlutterGeniusScan.scanWithConfiguration({
                  'source': 'camera',
                  'multiPage': true,
                }).then((result) {
                  String pdfUrl = result['pdfUrl'];
                  print(pdfUrl);
                  OpenFile.open(pdfUrl.replaceAll("file://", '')).then(
                          (result) => debugPrint(result),
                      onError: (error) => displayError(context, error));
                }, onError: (error) => displayError(context, error));
              },
          ),
        )
    );

  }

  void displayError(BuildContext context, PlatformException error) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(error.message)));
  }
}
