import 'package:flutter/material.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:digitisation/model/photo_ocr_helper.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';


Future<void> isPresent() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print(e);
  }
}

class OCRScreen extends StatefulWidget {
  @override
  _OCRScreenState createState() => _OCRScreenState();
}

class _OCRScreenState extends State<OCRScreen> {
  @override
  void initState() {
    super.initState();
    isPresent();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: Text(
            'Photo OCR',
            style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 20.0,left:MediaQuery.of(context).size.width *.68,right: 10.0 ),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.camera_alt),
            label: Text("Scan"),
            onPressed: () {
              Navigator.pushNamed(context, '/photoocr');
            },
          ),
        )
    );
  }
}






List<CameraDescription> cameras = [];

class PhotoOCR extends StatefulWidget {
  @override
  _PhotoOCRState createState() => _PhotoOCRState();
}

class _PhotoOCRState extends State<PhotoOCR> {

  CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> _takePicture() async {
    if (!_controller.value.isInitialized) {
      print("Controller is not initialized");
      return null;
    }

    // Formatting Date and Time
    String dateTime = DateFormat.yMMMd()
        .addPattern('-')
        .add_Hms()
        .format(DateTime.now())
        .toString();

    String formattedDateTime = dateTime.replaceAll(' ', '');
    print("Formatted: $formattedDateTime");

    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String visionDir = '${appDocDir.path}/Photos/Vision\ Images';
    await Directory(visionDir).create(recursive: true);
    final String imagePath = '$visionDir/image_$formattedDateTime.jpg';

    if (_controller.value.isTakingPicture) {
      print("Processing is progress ...");
      return null;
    }

    try {
      await _controller.takePicture(imagePath);
    } on CameraException catch (e) {
      print("Camera Exception: $e");
      return null;
    }

    return imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo OCR'),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
      ),
      body: _controller.value.isInitialized
          ? Stack(
        children: <Widget>[
          CameraPreview(_controller),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30.0,left: MediaQuery.of(context).size.width *0.35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.purple[100],
                  ),
                  child: FlatButton.icon(
                      onPressed: () async {
                        await _takePicture().then((String path) {
                          if (path != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(path),
                              ),
                            );
                          }
                        });
                      },
                      icon: Icon(Icons.camera,size: 40.0,color: Colors.purple,),
                      label: Text('Click',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0,color: Colors.black))
                  )
              ),
            ],
          )
        ],
      )
          : Container(
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}




// Container(
// alignment: Alignment.bottomCenter,
// child: RaisedButton.icon(
// icon: Icon(Icons.camera),
// label: Text("Click"),
// onPressed: () async {
// await _takePicture().then((String path) {
// if (path != null) {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => DetailScreen(path),
// ),
// );
// }
// });
// },
// ),
// ),