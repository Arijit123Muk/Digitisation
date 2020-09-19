import 'package:digitisation/ui/dashboard.dart';
import 'package:digitisation/ui/login.dart';
import 'package:digitisation/ui/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/sign_in',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/sign_in':
            return PageTransition(
              child: SignInScreen(),
              type: PageTransitionType.leftToRight,
              settings: settings,
            );
            break;
          case '/sign_up':
            return PageTransition(
              child: SignUpScreen(),
              type: PageTransitionType.leftToRight,
              settings: settings,
            );
            break;

          //  <<============================ Main App =====================>>

          case '/dashboard':
            return PageTransition(
              child: Dashboard(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
            break;
          default:
            return null;
        }
      },
    );
  }
}
