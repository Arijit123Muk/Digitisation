import 'package:digitisation/model/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String qrresult='';
class QR_Scanner extends StatefulWidget {
  @override
  _QR_ScannerState createState() => _QR_ScannerState();
}

class _QR_ScannerState extends State<QR_Scanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.0,bottom: 10.0),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *0.4,
              child: QrCodeScanner(),
            ),

            // Container(
            //   margin: EdgeInsets.only(top: 7.0,bottom: 10.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.blue
            //   ),
            //   width: MediaQuery.of(context).size.width *.80,
            //   height: MediaQuery.of(context).size.height *0.1,
            //   child: Padding(
            //     padding: EdgeInsets.only(left: 10.0,top: 30.0,right: 10.0),
            //     child: RichText(
            //     text: TextSpan(
            //       text: 'URL :~ ',
            //       style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'KumbhSans'),
            //       children: <TextSpan>[
            //         TextSpan(text: qrresult, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0,fontFamily: 'KumbhSans')),
            //       ],
            //     ),
            //   ),),
            // ),
          ],
        )
      ),
      //     floatingActionButton: Container(
      //        margin: EdgeInsets.only(bottom: 30.0,),
      //        child: FloatingActionButton.extended(
      //          backgroundColor: Colors.deepPurple,
      //          icon: Icon(Icons.launch),
      //          label: Text("Open QR",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'KumbhSans')),
      //          onPressed:() {
      //            launchURL(qrresult);
      //          },
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}

