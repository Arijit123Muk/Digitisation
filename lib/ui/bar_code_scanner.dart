import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class BarCode extends StatefulWidget {
  @override
  _BarCodeState createState() => _BarCodeState();
}

class _BarCodeState extends State<BarCode> {
  String _qrInfo = 'Scan a QR/Bar code';
  bool _camState = false;

  _qrCallback(String code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _camState?Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 100.0),
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height *0.40,
                child: Center(
                  child: QRBarScannerCamera(
                    onError: (context, error) => Text(
                      error.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (code) {
                      _qrCallback(code);
                    },
                  ),
                )
            )
          ],
        ):Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 7.0,bottom: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue
              ),
              width: MediaQuery.of(context).size.width *.80,
              height: MediaQuery.of(context).size.height *0.1,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0,top: 30.0,right: 10.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Bar Code :~ ',
                    style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'KumbhSans'),
                    children: <TextSpan>[
                      TextSpan(text:_qrInfo, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0,fontFamily: 'KumbhSans')),
                    ],
                  ),
                ),),
            ),
            SizedBox(height: 50.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.purple[100],
                  ),
                  child: FlatButton.icon(
                      onPressed: (){
                        ClipboardManager.copyToClipBoard(_qrInfo).then((result) {
                          final snackBar = SnackBar(
                            content: Text('Copied to Clipboard'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                print('Copy to clipboard');
                              },
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        });
                      },
                      icon: Icon(Icons.copy,size: 40.0,color: Colors.purple,),
                      label: Text('Copy',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0,color: Colors.black))
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.purple[100],
                    ),
                    child: FlatButton.icon(
                        onPressed: (){
                          setState(() {
                            _camState = true;
                          });
                        },
                        icon: Icon(Icons.restore,size: 40.0,color: Colors.purple,),
                        label: Text('Reset',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0,color: Colors.black))
                    )
                ),
              ],
            )
          ],
        )
    );
  }
}


// Center(
// child: Text(_qrInfo),
// ),