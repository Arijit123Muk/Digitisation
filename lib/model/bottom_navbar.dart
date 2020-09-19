import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

Widget bottomnav(_currentIndex,context)
{
  return CurvedNavigationBar(
    backgroundColor: Colors.white,
    color: Colors.purple[200],
    buttonBackgroundColor: Colors.purple[100],
    height: 52.0,
    index: _currentIndex,
    animationDuration: Duration(
      milliseconds: 200,
    ),
    animationCurve: Curves.bounceInOut,
    items: <Widget>[
      Icon(Icons.home, size: 34, color: Colors.purple),
      Icon(Icons.camera_alt, size: 34, color: Colors.purple),
      Icon(Icons.scanner_outlined, size: 34, color: Colors.purple),
     // Icon(Icons.fitness_center, size: 34, color: Colors.deepOrange),
      Icon(Icons.person, size: 34, color: Colors.purple),
    ],
    onTap: (index) {
      if (index == 0 && _currentIndex != index) {
        Navigator.pushReplacementNamed(context, '/dashboard');
        print('Going to Dashboard Selection');
      }
      else if(index == 1 && _currentIndex != index){
        Navigator.pushReplacementNamed(context,'/pdf_scanner');
        print('Going to  Selection');
      }
      else if (index == 2 && _currentIndex != index) {
        Navigator.pushReplacementNamed(context, '/qrbarcode');
        print('Going to QR Scanning Selection');
      }
      else if(index == 3 && _currentIndex != index){
        Navigator.pushReplacementNamed(context, '/profile');
        print('Going to Profile Selection');
      }
    },
  );

}




