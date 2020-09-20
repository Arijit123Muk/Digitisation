import 'package:digitisation/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:custom_dialog/custom_dialog.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
String email='';
String password='';
String confirm_password='';
String error='';
bool isselect = true,isselect1 = true;
int key = 0,key1 = 0;
class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          BackButtonWidget(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.mail), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          keyboardType:TextInputType.emailAddress,
                          onChanged: (val){email = val;},
                          decoration: InputDecoration(hintText: 'Email'),
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
                          onChanged: (val){password = val;},
                          decoration: InputDecoration(hintText: 'Password'),
                        ))),
                IconButton(
                    icon: (key%2==0)?Image.asset('assets/images/closed_eye.png',scale: 8.0,):Icon(Icons.remove_red_eye,),
                    onPressed: (){
                      if(key%2==0){
                        setState(() {
                          isselect = false;
                          key = key+1;
                        });}
                      else {
                        setState(() {
                          isselect = true;
                          key = key+1;
                        });
                      }
                    }
                ),
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
                          onChanged: (val){confirm_password = val;},
                          obscureText: isselect1,
                          decoration: InputDecoration(hintText: 'Confirm Password'),
                        ))),
                IconButton(
                    icon: (key1%2==0)?Image.asset('assets/images/closed_eye.png',scale: 8.0,):Icon(Icons.remove_red_eye,),
                    onPressed: (){
                      if(key1%2==0){
                        setState(() {
                          isselect1 = false;
                          key1 = key1+1;
                        });}
                      else {
                        setState(() {
                          isselect1 = true;
                          key1 = key1+1;
                        });
                      }
                    }
                ),
              ],
            ),
          ),

          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Radio(value: null, groupValue: null, onChanged: null),
                RichText(text: TextSpan(
                    text: 'I have accepted the',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: 'Terms & Condition',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold))
                    ]
                ))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 50,
                child: RaisedButton(
                  onPressed: () async{
                    if(LoginCheck()) {
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
                          title: Text(error,style: TextStyle(fontSize: 15.0,),),
                          firstColor: Colors.red,
                          secondColor: Colors.white,
                          headerIcon: Icon(
                            Icons.error_outline,
                            size: 120.0,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    else {
                      print(email);print(password);
                      bool verify = await signUp(email, password);
                      if(verify)
                        Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
                      else{
                        print('SignUp Error');
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
                            title: Text(error,style: TextStyle(fontSize: 15.0,),),
                            firstColor: Colors.red,
                            secondColor: Colors.white,
                            headerIcon: Icon(
                              Icons.error_outline,
                              size: 120.0,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  color: Colors.purple,
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0,),
          InkWell(
            onTap: (){
              Navigator.pushReplacementNamed(context, '/sign_in');
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Already Have an Account?',
                    style: TextStyle(color: Colors.black,fontSize: 20.0),
                    children: [
                      TextSpan(
                        text: 'SIGN IN',
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.bold,fontSize: 25.0),
                      )
                    ]),
              ),
            ),
          )

        ],
      ),
    );
  }

  bool LoginCheck()
  {
    String s ="";
    if (email !="" && password!="" && confirm_password!="")
    {
      if (password == confirm_password)
        return false;
      else
      {
        s = "Password and Confirm Password mismatch";
        setState(() {
          error = s;
          print(error);
        });
        return true;
      }
    }
    else if(email == "" && password!="" && confirm_password!="")
    {
      s = "Please Enter a E-mail ID!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    }
    else if(email !="" && password=="" && confirm_password!="")
    {
      s = "Please Enter a Password!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    }
    else if(email =="" && password =="" && confirm_password!=""){
      s = "Please fill Email and Password!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    }
    else if(email !="" && password!="" && confirm_password=="")
    {
      s = "Please Enter the Confirm Password!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    }
    else{
      s = "Please fill it Properly!";
      setState(() {
        error = s;
        print(error);
      });
      return true;
    }
  }

}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/bg1.png')),
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),),
      child: Positioned(
          child: Stack(
            children: <Widget>[

              Positioned(
                bottom: 20,
                left: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Create Your Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )
            ],
          )),
    );
  }
}