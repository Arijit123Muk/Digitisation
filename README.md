# Digitisation

<a href="">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/assets/images/logo.PNG"
         width=1000" height="600"></a>


* It can Scan pages convert them in pdfs
* It can Scan handwritten text
* It can Scan Bar code as well as 
* It can Scan QR codes 

This app contain well designed profile and dashboard screen, which can be changed whenever you wish to.
It will alse with our cloud storage scheme where you can store multiple files with security guarantee.

## Getting Started ##
 __Note:__ Make sure your Flutter environment is setup. If not please read <a href="https://flutter.dev/docs">Flutter Documentation</a>.

__Installation__
In the command terminal, run the following commands:
```git
$ git clone https://github.com/Arijit123Muk/Digitisation.git
$ cd Digitisation
$ flutter doctor
$ flutter pub get
$ flutter run
```
## Stimulate for iOS ##

###### Method One ######
```
Open the project in Xcode from ios/Runner.xcodeproj.
Hit the play button.
```

###### Method Two ######
In the command terminal, run the following commands:
```
$ open -a Simulator
$ flutter doctor
$ flutter pub get
$ flutter run
```

## Stimulate for Android ##
Make sure you have an _Android Emulator_ installed and running.
Run the following command in your terminal.
```
$ flutter doctor
$ flutter pub get
$ flutter run
```

## Digitisation Features:

* Splash
* Sign In
* Sign Up with email or google
* Carousel
* Dashboard
* Doc Scanner
* Photo OCR Scanner(Text Recognition)
* QR Code Scanner
* Bar-Code Scanner
* Copy to Clipboard
* Profile

### Up-Coming Features:
* Internal Sharing and External Sharing
* Cloud Storing
* ML/DL Model for OCR 

### Libraries & Tools Used
 * [sign_button](https://pub.dev/packages/sign_button)
 * [custom_dialog](https://pub.dev/packages/custom_dialog)
 * [curved_navigation_bar](https://pub.dev/packages/custom_dialog)
 * [intro_slider](https://pub.dev/packages/intro_slider)
 * [image_picker](https://pub.dev/packages/image_picker)
 * [page_transition](https://pub.dev/packages/page_transition)
 * [shared_preferences](https://pub.dev/packages/page_transition)
 * [flutter_spinkit](https://pub.dev/packages/flutter_spinkit)
 * [firebase_auth](https://pub.dev/packages/firebase_auth)
 * [firebase_core](https://pub.dev/packages/firebase_core)
 * [firebase_database](https://pub.dev/packages/firebase_database)
 * [google_sign_in](https://pub.dev/packages/google_sign_in)
 * [camera](https://pub.dev/packages/camera)
 * [path_provider](https://pub.dev/packages/path_provider)
 * [path](https://pub.dev/packages/path)
 * [esys_flutter_share](https://pub.dev/packages/esys_flutter_share)
 * [flutter_genius_scan](https://pub.dev/packages/flutter_genius_scan)
 * [open_file](https://pub.dev/packages/open_file)
 * [qr_code_scanner](https://pub.dev/packages/qr_code_scanner)
 * [torch_compat](https://pub.dev/packages/torch_compat)
 * [clipboard_manager](https://pub.dev/packages/clipboard_manager)
 * [url_launcher](https://pub.dev/packages/url_launcher)
 * [flutter_qr_bar_scanner](https://pub.dev/packages/flutter_qr_bar_scanner)
 * [firebase_ml_vision](https://pub.dev/packages/firebase_ml_vision)

### Folder Structure
Here is the core folder structure which flutter provides.

```
Digitisation/
|- ML Model
|- UI UX
|- Screenshot
|- android
|- assets/images
|- fonts
|- ios
|- lib
```


Here is the folder structure we have been using in this project for __*ML Model Development*__

```
ML Model/
|- Scan Bot.ipynb/
|- training_model.ipynb
```

Now, lets dive into the ML Model folder which has the code for the application.
```
1- Scan Bot.ipynb — This is the model is used for scanning the documents and image processing.In this we have used open cv library and its functions such as contours, Canny, GuassianBlur. This model will give us a proper gray scanned image.
2- training_model.ipynb — This model is used to predict the written digits.In this we have used one of the most used library that is Tensorflow.We have trained 200 samples and have 230 samples for testing purpose. This will output a tkinter canvas where you can write any digit and it will recognize the digit.
```
Here is the folder structure we have been using in this project for __*UI UX Development*__

```
UI UX/
|- Create Account.png
|- Dashbourd.png
|- Forget Password.png
|- Profile.png
```

Here is the folder structure we have been using in this project for __*Flutter App*__

```
lib/
|- model/
|- services/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- model — In this folder all the helper function and classes are present this folder which helps to provide support to the main app.
2- services — It contain firebase linked file which help us to keep our application in contact with Firebase.
3- ui — Contains all the ui of your project, contains sub directory for each screen.
4- main.dart — This is the starting point of the application. All the application level configurations are defined in this file i.e, carousel,dashboard,profile,splash,etc.
```
### Model

This directory contains all the model of the application. In this folder all the helper function and classes are present this folder which helps to provide support to the main app.

```
model/
|- bottom_navbar
|- photo_ocr_helper
|- profile_helper
|- qr_code_scanner
```

### Services

This directory contains all the services required for the application. It contain firebase linked file which help us to keep our application in contact with Firebase.

```
services/
|- auth
|- database
```

### UI

This directory contains all the ui of your application. It helps to easily distinguished between frontened and backened

```
ui/
|- bar_code_scanner
|- carousel
|- dashboard
|- forget_password
|- login
|- pdf_scanner
|- photo_ocr_ui
|- profile
|- qr_scanner
|- qrbarcode
|- scanner
|- sign_up
|- splash
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
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


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterGeniusScan.setLicenceKey('533c50065455000505550151395550071706514a57591c5d0b515d125e4b51440b5b0a3d09030604550406005a50');
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
          case  '/sign_up':
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
          case  '/carousel':
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
          case  '/profile':
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
```

## Demo ##
<p>
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Splash%20Screen.jpg"
         width=300" height="500">
                                
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Login.jpg"
         width=300" height="500">  
                                
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Carousel.gif"
         width=300" height="500">
 </p>
  
 <p> 
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Forget%20Password.jpg"
         width=300" height="500">
                                
                                
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Create%20Account.jpg"
         width=300" height="500">
                                
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Dashboard.jpg"
         width=300" height="500">    
</p>
                                
<p> 
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Profile.jpg"
         width=300" height="500">
         
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Doc.gif"
         width=300" height="500">
                                
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Photo%20OCR.gif"
         width=300" height="500">
</p>
    
<p>
 <a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/QR.gif"
         width=300" height="500">
                                
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Photo%20OCR.gif"
         width=300" height="500">
<a href="https://github.com/Arijit123Muk/Digitisation/tree/master/ScreenShot">
         <img alt="Qries" src="https://github.com/Arijit123Muk/Digitisation/blob/master/ScreenShot/Bar%20Code.gif"
         width=300" height="500">
</p>       
For more screenshot open folder Screenshots </a>

## Conclusion

We are will be happy to answer any questions that you may have on this app,🙂

This app is a very powerful tool for scanning documents, bar code, QR code, and recognising text.

<p style="text-align:right;"><b>Team Vector Hunters.</b></p>



