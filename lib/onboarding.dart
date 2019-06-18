import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

// void main() => runApp(MyApp());

// Screens 2, 3, 4
class OnboardingPage extends StatefulWidget {
  final String title;
  OnboardingPage({this.title});
  @override
  OnboardingPageState createState() {
    return new OnboardingPageState();
  }
}

class OnboardingPageState extends State<OnboardingPage> {
  int _slideIndex = 0;
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  final List<String> images = [
    "assets/slide_1.png",
    "assets/slide_2.png",
    "assets/slide_3.png",
  ];

  List<Color> colors = [Colors.orange];
  final List<String> text0 = [
    "Welcome to your app",
    "Enjoy teaching...",
    "Showcase your skills",
  ];

  final List<String> text1 = [
    "App for food lovers, satisfy your taste",
    "Find best meals in your area, simply",
    "Have fun while eating with your relatives",
  ];

  final IndexController controller = IndexController();
  @override
  Widget build(BuildContext context) {
    TransformerPageView transformerPageView = TransformerPageView(
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            this._slideIndex = index;
          });
        },
        loop: false,
        controller: controller,
        transformer: new PageTransformerBuilder(
            builder: (Widget child, TransformInfo info) {
          return new Material(
            color: Colors.white,
            elevation: 8.0,
            textStyle: new TextStyle(color: Colors.white),
            borderRadius: new BorderRadius.circular(12.0),
            child: new Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new ParallaxContainer(
                      child: new Text(
                        text0[info.index],
                        style: new TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 34.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                      position: info.position,
                      opacityFactor: .8,
                      translationFactor: 400.0,
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    new ParallaxContainer(
                      child: new Image.asset(
                        images[info.index],
                        fit: BoxFit.contain,
                        height: 350,
                      ),
                      position: info.position,
                      translationFactor: 400.0,
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    new ParallaxContainer(
                      child: new Text(
                        text1[info.index],
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 28.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                      position: info.position,
                      translationFactor: 300.0,
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                    new ParallaxContainer(
                      position: info.position,
                      translationFactor: 500.0,
                      child: Dots(
                        controller: controller,
                        slideIndex: _slideIndex,
                        numberOfDots: images.length,
                      ),
                    ),
                      new NextButtons(),

                  ],
                ),
              ),
            ),
          );
        }),
        itemCount: 3);

    return Scaffold(
      backgroundColor: Colors.white,
      body: transformerPageView,
    );
  }
}

class Dots extends StatelessWidget {
  final IndexController controller;
  final int slideIndex;
  final int numberOfDots;
  Dots({this.controller, this.slideIndex, this.numberOfDots});

  List<Widget> _generateDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; i++) {
      dots.add(i == slideIndex ? _activeSlide(i) : _inactiveSlide(i));
    }
    return dots;
  }

  Widget _activeSlide(int index) {
    return GestureDetector(
      onTap: () {
        print('Tapped');
      },
      child: new Container(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            width: 14.0,
            height: 14.0,
            decoration: BoxDecoration(
              color: Colors.orangeAccent.withOpacity(.3),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inactiveSlide(int index) {
    return GestureDetector(
      onTap: () {
        controller.move(index);
      },
      child: new Container(
        child: Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateDots(),
    ));
  }
}

class NextButtons extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
          child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: OutlineButton(
                padding: EdgeInsets.all(16.0),
                child: Text("Sign In"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () => null,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.black,
              ),
              child: FlatButton(
                // splashColor: Colors.blue,
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => null,
              ),
            ),
          )
        ],
      )

      // Old button implementation
          /* child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlineButton(
                child: Text('Sign In'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black,
                ),
                child: FlatButton(
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          */
          ),
    );
  }
}