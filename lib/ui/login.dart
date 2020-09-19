import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:custom_dialog/custom_dialog.dart';
import 'package:sign_button/sign_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

String email = '';
String password = '';
String error = '';
bool isselect = true;
int key = 0;

class _SignInScreenState extends State<SignInScreen> {
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
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/bg1.png')),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 220.0),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) {
                            email = val;
                          },
                          decoration: InputDecoration(hintText: 'Username'),
                        )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.lock), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          obscureText: isselect,
                          onChanged: (val) {
                            password = val;
                          },
                          decoration: InputDecoration(hintText: 'Password'),
                        ))),
                IconButton(
                    icon: (key % 2 == 0)
                        ? Image.asset(
                            'assets/images/closed_eye.png',
                            scale: 8.0,
                          )
                        : Icon(
                            Icons.remove_red_eye,
                          ),
                    onPressed: () {
                      if (key % 2 == 0) {
                        setState(() {
                          isselect = false;
                          key = key + 1;
                        });
                      } else {
                        setState(() {
                          isselect = true;
                          key = key + 1;
                        });
                      }
                    }),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .65),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: RichText(
                  text: TextSpan(
                      //text: 'Don\'t have an account?',
                      //style: TextStyle(color: Colors.black,fontSize: 20.0),
                      children: [
                        TextSpan(
                          text: 'Forget Password?',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        )
                      ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                height: 50,
                child: RaisedButton(
                  onPressed: () async {
                    if (LoginCheck()) {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          content: Text(
                            'FAILED!',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                          title: Text(
                            error,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          firstColor: Colors.red,
                          secondColor: Colors.white,
                          headerIcon: Icon(
                            Icons.error_outline,
                            size: 120.0,
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      Navigator.popAndPushNamed(context, '/dashboard');
                    }
                  },
                  color: Colors.purple,
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Center(
              child: Text(
            '-----OR------',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )),
          Container(
            margin: EdgeInsets.only(
                left: 30.0, right: 30.0, top: 10.0, bottom: 20.0),
            child: SignInButton(
                buttonSize: ButtonSize.large,
                imagePosition: ImagePosition.left, // left or right
                buttonType: ButtonType.google,
                onPressed: () {
                  print('Google click');
                }),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/sign_up');
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                    children: [
                      TextSpan(
                        text: 'SIGN UP',
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool LoginCheck() {
    String s = "";
    if (email != "" && password != "") {
      return false;
    } else if (email == "" && password != "") {
      s = "Please Enter a E-mail ID!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    } else if (email != "" && password == "") {
      s = "Please Enter a Password!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    } else {
      s = "Please fill Email and Password!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    }
  }
}
