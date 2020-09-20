import 'package:digitisation/ui/carousel.dart';
import 'package:digitisation/ui/dashboard.dart';
import 'package:digitisation/ui/forget_password.dart';
import 'package:digitisation/ui/login.dart';
import 'package:digitisation/ui/photo_ocr_ui.dart';
import 'package:digitisation/ui/profile.dart';
import 'package:digitisation/ui/qrbarcode.dart';
import 'package:digitisation/ui/scanner.dart';
import 'package:digitisation/ui/sign_up.dart';
import 'package:digitisation/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_genius_scan/flutter_genius_scan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterGeniusScan.setLicenceKey(
      '533c50065455000505550151395550071706514a57591c5d0b515d125e4b51440b5b0a3d09030604550406005a50');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash':
            return PageTransition(
              child: Splash(),
              type: PageTransitionType.leftToRight,
              settings: settings,
            );
            break;
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
          case '/forget_password':
            return PageTransition(
              child: Forget_Password(),
              type: PageTransitionType.leftToRight,
              settings: settings,
            );
            break;
          case '/carousel':
            return PageTransition(
              child: IntroScreen(),
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
          case '/pdf_scanner':
            return PageTransition(
              child: Scanner(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
            break;
          case '/qrbarcode':
            return PageTransition(
              child: QRandBARCode(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
            break;
          case '/profile':
            return PageTransition(
              child: Profile(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
            break;
          case '/photoocr':
            return PageTransition(
              child: PhotoOCR(),
              type: PageTransitionType.leftToRight,
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
