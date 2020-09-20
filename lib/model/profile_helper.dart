import 'package:digitisation/services/auth.dart';
import 'package:flutter/material.dart';

Widget ListRows(String images,String text,String routeName,context)
{
  return InkWell(
    onTap: () async{
      if (text == 'Signout')
        {
         bool verify = await signOutGoogle();
          if(verify)
            Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false);
          else
            print('ERROR');
        }
      else if (text == 'Delete Account')
      {
        bool verify = await DeleteAccount();
        if(verify)
          Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false);
        else
          print('ERROR');
      }
      else
        Navigator.pushNamed(context, routeName);
      },
    child: Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Image.asset('assets/images/$images',width: 20.0,)
        ),
        SizedBox(width: 20.0,),
        Text('$text',style: TextStyle(fontFamily: 'NotoSans',fontSize: 20.0,fontWeight: FontWeight.w300,color: Colors.black),),
        Spacer(),
        Icon(Icons.keyboard_arrow_right_outlined,size: 35.0,color: Colors.black54,),
      ],
    ),
  );
}

