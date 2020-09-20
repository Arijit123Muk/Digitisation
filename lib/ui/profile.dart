import 'package:digitisation/model/bottom_navbar.dart';
import 'package:digitisation/model/profile_helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

int _currentIndex = 3;
String name ='no';
String email='no';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomnav(_currentIndex, context),
      body:FutureBuilder(
        future: UserData(),
        builder: (context,snapshot){
          return (snapshot.hasData)?SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left:20.0,top: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:15.0,bottom: 20.0),
                          child: Text('Profile',style: TextStyle(fontFamily: 'KumbhSans',fontSize: 35.0,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.13,
                          margin:EdgeInsets.only(top:15.0,bottom: 20.0) ,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.purple[100]
                          ),
                          child: Image.asset('assets/images/profile.png',fit: BoxFit.cover,),
                        ),
                        SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name==null?'Name Not Found':name,style: TextStyle(fontFamily: 'NotoSans',fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(email==null?'No':email,style: TextStyle(fontFamily: 'NotoSans',fontSize: 10.0,fontWeight: FontWeight.bold,color: Colors.black54),),
                            FlatButton.icon(
                                onPressed: null,
                                icon: Icon(Icons.create,size: 14.0,color: Colors.black54),
                                label: Text('Edit Profile',style: TextStyle(fontFamily: 'NotoSans',fontSize: 14.0,color: Colors.black54),)
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    ListRows('notification.png', 'Notification', 'routeName',context),
                    ListRows('settings.png', 'Settings', 'routeName',context),
                    ListRows('faq.png', 'FAQ', 'routeName',context),
                    ListRows('policy.png', 'Policy', 'routeName',context),
                    ListRows('signout.png', 'Signout', 'routeName',context),
                    ListRows('delete.png', 'Delete Account', 'routeName',context),
                    Divider(height: 1.0,indent: 20.0,endIndent: 20.0,color: Colors.black38,),

                    SizedBox(height: 10.0,),
                    Text('Version V1.0' ,style: TextStyle(fontFamily: 'NotoSans',fontSize: 14.0,color: Colors.black54),)
                  ],
                ),
              ),
            ),
          ):SpinKitWave(
            color: Colors.purple[400],
            size: 50.0,
          );
        },
      )
    );
  }

  Future<bool> UserData() async {
    try
    {
      if (_auth.currentUser != null) {
        name = _auth.currentUser.displayName;
        print(_auth.currentUser.displayName);
        email = _auth.currentUser.email;
        print(_auth.currentUser.email);
        return true;
      }
    }
    catch(e){
      print("User Signed Out Failed! $e");
    }
  }

}
