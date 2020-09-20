import 'package:digitisation/model/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

int _currentIndex = 0;
String name = 'Arijit';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomnav(_currentIndex, context),
      body: FutureBuilder(
          future: UserData(),
          builder: (context,snapshot)
          {
            return  (snapshot.hasData)?SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.only(left:10.0,top: 10.0,right: 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children:<Widget> [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 15, 0, 2),
                                  child: Text(
                                    'Hello',
                                    style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                                  width: MediaQuery.of(context).size.width *0.40,
                                  child: Text(name==null?'Name Not Found':name,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            //     SizedBox(width: MediaQuery.of(context).size.width*0.01),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width* 0.12,
                              child: Image.asset('assets/images/hi.jpeg',fit: BoxFit.contain),
                            ),
                           // SizedBox(width:MediaQuery.of(context).size.width*0.10),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.19,
                              height: MediaQuery.of(context).size.height * 0.09,
                              margin:EdgeInsets.only(top:15.0,bottom: 20.0,left: MediaQuery.of(context).size.width*0.20) ,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.purple[100]
                              ),
                              child: Image.asset('assets/images/profile.png',fit: BoxFit.cover,),
                            ),
                          ],
                        ),
                        SizedBox(height:20.0,),
                        Row(
                          children: <Widget>[
                            SizedBox(width:MediaQuery.of(context).size.width* 0.007),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: ()=>Navigator.pushReplacementNamed(context,'/pdf_scanner'),
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  height: MediaQuery.of(context).size.height*0.30,
                                  padding: const EdgeInsets.all(40.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [BoxShadow(
                                        color: Colors.purple[100],
                                        blurRadius: 2.0,
                                      ),]
                                    //border:Border.all(color:Colors.grey),
                                  ),
                                  child: Column(
                                      children:<Widget>[
                                        Image.asset('assets/images/ocr.png'),
                                        SizedBox(
                                          height:10.0,
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(left:0, top:10),
                                          child:Text('OCR',style: TextStyle(fontFamily: 'NotoSans',fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                                        )
                                      ]
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width:MediaQuery.of(context).size.width*0.05),

                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: ()=>Navigator.pushReplacementNamed(context,'/pdf_scanner'),
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  height: MediaQuery.of(context).size.height*0.30,
                                  padding: const EdgeInsets.all(30.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [BoxShadow(
                                        color: Colors.purple[100],
                                        blurRadius: 2.0,
                                      ),]
                                    //border:Border.all(color:Colors.grey),
                                  ),
                                  child: Column(
                                      children:<Widget>[
                                        Image.asset('assets/images/doc_scanner.png'),
                                        SizedBox(
                                          height:10.0,
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(left:0, top:10),
                                          child:Text('Scanner',style: TextStyle(fontFamily: 'NotoSans',fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                                        )
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height:MediaQuery.of(context).size.height*0.02),

                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: ()=> Navigator.pushReplacementNamed(context, '/qrbarcode'),
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  height: MediaQuery.of(context).size.height*0.30,
                                  padding: const EdgeInsets.fromLTRB(40.0,40,27,40),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.purple[100],
                                          blurRadius: 2.0,
                                        ),]
                                    //border:Border.all(color:Colors.grey),
                                  ),
                                  child: Column(
                                      children:<Widget>[
                                        Container(
                                            width: MediaQuery.of(context).size.width * .20,
                                            height: MediaQuery.of(context).size.height * .10,
                                            child: Image.asset('assets/images/barcode.png',fit: BoxFit.fill,)
                                        ),
                                        SizedBox(
                                          height:5.0,
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(left:0, top:10),
                                          child:Text('Bar Code',style: TextStyle(fontFamily: 'NotoSans',fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                                        )
                                      ]
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width:MediaQuery.of(context).size.width*0.05),

                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: ()=> Navigator.pushReplacementNamed(context, '/qrbarcode'),
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  height: MediaQuery.of(context).size.height*0.30,
                                  padding: const EdgeInsets.all(50.0),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),boxShadow: [BoxShadow(
                                    color: Colors.purple[100],
                                    blurRadius: 2.0,
                                  ),]
                                    //border:Border.all(color:Colors.grey),
                                  ),
                                  child: Column(
                                      children:<Widget>[
                                        Image.asset('assets/images/qr scanner.png'),
                                        SizedBox(
                                          height:10.0,
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(left:0, top:10),
                                          child:Text('QR',style: TextStyle(fontFamily: 'NotoSans',fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                                        )
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ):SafeArea(
                child: Center(
                    child: SpinKitWave(
                    color: Colors.purple[400],
                    size: 50.0,
                ),
            ));
           }
          ),
    );
  }

  Future<bool> UserData() async {
    try
    {
      if (_auth.currentUser != null) {
        name = _auth.currentUser.displayName;
        print(_auth.currentUser.displayName);
        return true;
      }
    }
    catch(e){
      print("User Signed Out Failed! $e");
    }
  }
}
