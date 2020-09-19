import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "PDF Scanner",
        styleTitle: TextStyle(
            color: Colors.purple,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'KumbhSans'),
        description: "It is a very powerful tool for create Business Proposals,\n Contracts, Cases, Project activities documents and \nof course different kind of Quotes, Sales Order, Purchase Order, Invoices and other",
        styleDescription: TextStyle(
            color: Colors.blue[900],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'NotoSans'),
        pathImage: "assets/images/c2.png",
      ),
    );
    slides.add(
      new Slide(
        title: "QR and Bar Code Scanner",
        styleTitle: TextStyle(
            color: Colors.purple,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'KumbhSans'),
            description: "Easy and Handy All in one scanner",
            styleDescription: TextStyle(
            color:  Colors.blue[900],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'NotoSans'),
            pathImage: "assets/images/c1.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Share Everything",
        styleTitle: TextStyle(
            color:Colors.purple,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'KumbhSans'),
        description:
        "Easy to share on any platform",
        styleDescription: TextStyle(
            color:  Colors.blue[900],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'NotoSans'),
        pathImage: "assets/images/c3.jpg",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    Navigator.pushNamedAndRemoveUntil(context,  '/dashboard', (route) => false);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.white,
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                    currentSlide.pathImage,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Colors.purple,
      highlightColorSkipBtn: Colors.purple,

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Colors.purple,
      highlightColorDoneBtn: Colors.purple,

      // Dot indicator
      colorDot: Colors.purple,
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}

