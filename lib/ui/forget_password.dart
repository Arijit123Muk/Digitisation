import 'package:flutter/material.dart';
import 'package:custom_dialog/custom_dialog.dart';
import 'dart:async';
String email='';
class Forget_Password extends StatefulWidget {
  @override
  _Forget_PasswordState createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/images/bg1.png')),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 10.0),
                  child:  IconButton(
                      icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30.0,),
                      onPressed:()=> Navigator.pop(context)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 190.0),
                  child: Text(
                    'Forget Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.person), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          keyboardType:TextInputType.emailAddress,
                          onChanged: (val){email = val;},
                          decoration: InputDecoration(hintText: 'E-mail'),
                        )))
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                height: 50,
                child: RaisedButton(
                  onPressed: () async{
                      print('Forget Password');
                     await showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          content: Text(
                            'E-mail Verification',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                          title: Text('An E-mail is send please verify ',style: TextStyle(fontSize: 15.0,),),
                          firstColor: Colors.green,
                          secondColor: Colors.white,
                          headerIcon: Icon(
                            Icons.check_circle_outline,
                            size: 120.0,
                            color: Colors.white,
                          ),
                        ),
                      );
                      Timer(
                          Duration(milliseconds: 300),
                              () =>  Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false));
                  },
                  color: Colors.purple,
                  child: Text(
                    'Forget Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),

         ]
      )

    );
  }
}
